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
extern g_int_pole
extern g_suma
;***************************************************************************

    section .text

    ; functions

    ;global some_asm_function
    ;extern some_c_function

;some_asm_function:
    ;ret

global suma_pole

suma_pole:

    mov rdx, 0  ; i = 0
    mov [g_suma], dword 0
    mov eax, 0

.zpet:
    cmp rdx, 10     ; i >= 10
    jge .hotovo     ; hotovo

    add eax, [g_int_pole + rdx * 4]     ; tmp_sum += g_int_pole [i]

    inc rdx         ; i++
    jmp .zpet
.hotovo:
    mov [g_suma], eax
    ret