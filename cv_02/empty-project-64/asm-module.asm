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

extern g_str
extern g_strlen

extern g_max

extern num

extern g_char_array
;***************************************************************************

    section .text

    ; functions

    ;global some_asm_function
    ;extern some_c_function

;some_asm_function:
    ;ret

    global suma_pole
    global my_strlen
    global search_max
    global count_evens
    global count_vowels

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

;----------------------------------------------------------------------

my_strlen:
    mov rcx, 0
.zpet:    
    cmp [g_str + rcx], byte 0
    je .hotovo
    inc rcx
    jmp .zpet
.hotovo:
    mov [g_strlen], ecx     ; pozor, ne RCX
    ret

;---------------------------------------------------------------------

search_max:
    mov rdx, 0  ; i = 0
    mov eax, [g_int_pole + 0 * 4]

.zpet:
    cmp rdx, 10     ; i >= 10
    jge .hotovo     ; hotovo

    cmp eax, [g_int_pole + rdx * 4]
    jg .taknic
    mov eax, [g_int_pole  + rdx * 4]
.taknic:
    inc rdx
    jmp .zpet
.hotovo:
    mov [g_max], eax
    ret

;-----------------------------------------------------------------------

count_evens:
    mov rax, 0
    
    mov eax, 1      ;maska
    TEST [g_int_pole + rax * 4], eax

;---------------------------------------------------------------------

count_vowels:
    mov rdx, 0      ; i = 0
    mov rax, 0      ; k = 0
    mov eax, [g_char_array + 0]

.dalsi:
    cmp rdx, 32
    jge .hototvo

    cmp rax, 6
    jge .dalsi

.sem:
    mov al, [vowels + rax]
    cmp [g_char_array + rdx], al
    je .samohlaska
    inc rax
    jmp .sem

.samohlaska:
    inc num
    inc rdx
    mov rax, 0
    jmp .dalsi

.hotovo:
    ret