;***************************************************************************
;
; Program for education in subject "Assembly Languages" and "APPS"
; petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
;
; Empty project
;
;***************************************************************************

    bits 64

    section .data

    ; variables

    ;global g_some_asm_var
    ;extern g_some_c_var

;g_some_asm_var dd ?

extern g_long_array
extern g_sum
extern g_count

extern g_char_array
extern g_to_replace
extern g_new
extern count

extern g_mac_address
extern g_vendor_oui
extern g_vendor_name
extern vendor

global snd_fun
global fst_fun
global thrd_fun
;***************************************************************************

    section .text

    ; functions

    ;global some_asm_function
    ;extern some_c_function

;some_asm_function:
    ;ret


snd_fun:
    mov rdx, 0      ; i = 0
    ;for (rdx; rdx < 99;rdx++)
.dalsi:

    cmp rdx, 99
    je .hotovo

    mov al, byte [g_char_array + rdx]
    
    cmp al, byte [g_to_replace]
    je .replace
    
    inc rdx
    jmp .dalsi


.replace:
    mov ah, byte [g_new]
    mov [g_char_array + rdx], ah
    inc dword [count]
    inc rdx
    jmp .dalsi

.hotovo:
    ret

;----------------------------------------------------------------

fst_fun:
    mov rdx, 0
    mov rax, 0
    mov r9, qword [g_sum]
    mov r8, 0

.zpet:
    cmp r8, 5
    je .secteno

    add r9, [g_long_array + r8 * 8]
    inc r8
    jmp .zpet

.secteno:
    mov rax, r9
    mov r12, 3
    div r12
    cmp edx, 0
    je .divisible
    jmp .nondivisible

.divisible:
    popcnt r10, r9
    mov [g_count], r10
    jmp .hotovo

.nondivisible:
    popcnt r10, r9
    mov r11, 64
    sub r11, r10
    mov [g_count], r11
    jmp .hotovo

.hotovo:
    mov [g_sum], r9
    ret


;--------------------------------------------------------------

thrd_fun:
    mov r8, 0
    mov rax, 0 
    mov rcx, 0
    
    
    mov r8, [g_mac_address]
    shr r8, 24
    AND qword [g_mac_address], 0xFFFFFF
    ; counter
    mov rcx, 5

.loop:
    cmp r8d, [g_vendor_oui + rax * 4]
    je .found
    inc rax
    loop .loop
    mov [vendor], byte 0x0
    ret

.found:
    mov r8b, [g_vendor_name + rax]
    mov [vendor], r8b
    ret
