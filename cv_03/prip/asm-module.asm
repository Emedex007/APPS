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



    global str_merge_diff
str_merge_diff:
    enter 0,0
.zpet:
    cmp [rdi], byte 0
    je .hotovo


    mov r10, [rdi]
    cmp [rsi], r10
    je .taknic

    mov r9, [rsi]
    mov [rdx], r9
    inc rdi
    inc rsi
    inc rdx
    jmp .zpet

.taknic:
    inc rdi
    inc rsi
    jmp .zpet

.hotovo:
    leave
    ret

    global hamm_dist
hamm_dist:
    enter 0,0
    
    cmp rdi, 0
    jl .hotovo

    mov r10, [rdi]
    cmp [rsi], r10

.hotovo:
    leave
    ret