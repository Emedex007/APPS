bits 64
section .data
    extern g_long_array
    extern g_sum
    extern g_ones_zeros

    extern g_char_array
    extern g_to_replace
    extern g_new
    extern replaced

    extern g_mac_address
    extern g_vendor_oui
    extern g_vendor_name
    extern vendor
    extern mac

section .text
    global first_task
    global second_task
    global third_task

; Sečtěte čísla v poli g_long_array do proměnné g_sum. V proměnné g_sum spočítejte počet výskytu 1 v případě, že je dělitelné 3. V opačném případě spočítejte počet výskytu 0.
first_task:
    ; counter
    mov rdx, 0
    ; sum
    mov rax, 0

.loop:
    mov rcx, [g_long_array + rdx * 8]
    cmp rdx, 5
    jz .first_done
    inc rdx
    add rax, rcx
    jmp .loop

.first_done:
    mov [g_sum], rax
    mov r8, rax
    mov rdx, 0
    mov r9, 3
    div r9
    ; counter
    mov rcx, 32
    mov dword [g_ones_zeros], 0
    ; rdx - zbytek
    cmp rdx, 0  ; pokud nula tak je dělitelné třemi
    jz .ones
    jmp .zeros

.ones:
    shr r8, 1
    bt r8, 0
    jc .ones_y
    loop .ones
    jmp .done

.ones_y:
    inc dword [ g_ones_zeros ]
    loop .ones

.zeros:
    shr r8, 1
    bt r8, 0
    jnc .zeros_y
    loop .zeros
    jmp .done

.zeros_y:
    inc dword [ g_ones_zeros ]
    loop .zeros

.done:
    ret


; V poli g_char_array proveďte nahrazení znaku g_to_replace znakem zadaným v proměnné g_new. Vypište výsledné pole a počet nahrazených znaků.
second_task:
    ; counter
    mov rcx, 0
    ; replaced
    mov ebx, 0
    mov r8b, [g_to_replace]
    mov r9b, [g_new]

.loop:
    mov al, [g_char_array + rcx]
    cmp al, 0x00
    je .done
    cmp al, r8b
    je .found
    jmp .loop_end

.found:
    inc ebx
    mov [g_char_array + rcx], r9b
    jmp .loop_end

.loop_end:
    inc rcx
    jmp .loop

.done:
    mov [replaced], ebx
    ret

; V proměnné g_mac_address najděte označení výrobce a dle polí g_vendor_oui a g_vendor_name vypište jeho název. Proměnnou g_mac_address upravte tak, aby část pro zařízení byla nulová.
third_task:
    mov r8, [g_mac_address]
    shr r8, 24
    mov r9, 0
    AND qword [g_mac_address], 0xFFFFFF
    ; counter
    mov rcx, 5
    mov rax, 0

.loop:
    cmp r8d, [g_vendor_oui + rax * 4]
    jz .found
    inc rax
    loop .loop
    mov [vendor], byte 0x0
    ret

.found:
    mov r8b, [g_vendor_name + rax]
    mov [vendor], r8b
    ret
