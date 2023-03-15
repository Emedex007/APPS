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
    cmp [rdi], byte 0 ;arr_in1[rdi] == '\0'
    je .hotovo

    mov al, [rdi]
    cmp [rsi], al ; arr_in1[rdi] == arr_in2[rsi]
    je .taknic

    mov bl, [rsi]
    mov [rdx], al
    mov [rdx + 1], bl ; arr_out[rdx] = arr_in2[rsi]
    inc rdi
    inc rsi
    add rdx, 2
    jmp .zpet

.taknic:
    inc rdi
    inc rsi
    jmp .zpet

.hotovo:
    leave
    ret


;----------------------------------------------

    global hamm_dist
hamm_dist:
    enter 0,0
    mov eax, 0 ; vysledek
    mov ebx, 0
    mov ecx, 0
.zpet:
    cmp rdx, 0
    je .hotovo

    mov ebx, edi 
    xor ebx, [rsi] ;1 ^ prvek
.here:
    mov r8d, ebx    ; zaloha 
    and r8d, 1      ; lisi se lsb?
    add ecx, r8d    ; counter += r8d
    shr ebx, 1      ; shift right
    cmp ebx, 0      ; x > 0
    ja .here

    cmp eax, ecx
    cmovb eax, ecx
    dec rdx
    inc rsi
    jmp .zpet

.hotovo:
    leave
    ret

; int hammingDistance(int n1, int n2)
; {
;     int x = n1 ^ n2;
;     int setBits = 0;
 
;     while (x > 0) {
;         setBits += x & 1;
;         x >>= 1;
;     }
 
;     return setBits;
; }