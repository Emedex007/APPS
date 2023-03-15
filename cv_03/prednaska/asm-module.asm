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

;***************************************************************************

    section .text

    ; functions

    ;global some_asm_function
    ;extern some_c_function

;some_asm_function:
    ;ret

    global suma_int
    global suma_pole
    global pocet_cislic
    global max_pole


suma_int:
    mov eax, edi
    add eax, esi
    ret

suma_pole:
    movsx rsi, esi
    mov eax, 0
    mov rcx, 0
.zpet:
    cmp rcx,    rsi
    jge .hotovo

    add eax, [rdi + rcx * 4]    ; suma += pole[i]

    inc rcx
    jmp .zpet
.hotovo:
    ret

pocet_cislic:
    mov eax, 0
.zpet:
    cmp [rdi], byte 0 ;while(str != 0)
    je .hotovo

    cmp [rdi], byte '0'
    jl .taknic
    cmp [rdi], byte '9'
    jg .taknic
    inc eax

.taknic:
    inc rdi
    jmp .zpet
.hotovo:    
    ret

max_pole:
    movsx rsi, esi
    mov rax, [rdi]
    mov rcx, 1
.zpet:
    cmp rcx, rsi
    jge .hotovo

    cmp rax, [rdi + rcx * 8]
    cmovl rax, [rdi + rcx * 8]

    inc rcx
    jmp .zpet
.hotovo:
    ret