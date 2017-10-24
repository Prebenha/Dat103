cr equ 13
lf equ 10
SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1
ytre equ 0
indre equ 10

section	.bss
    num resb 1

section	.text
   global _start        
_start:	  
    mov edx, ytre
    mov ebx, indre
    mov ecx, 1
comp1:
    cmp ecx, ebx
    jl ink
comp2:
    cmp ecx, edx
    jg dek
    je fin
ink:
    inc ecx
    jmp comp1
dek:    
    dec ecx
    jmp comp2
fin:
   mov eax, ecx
   add eax, '0'
   mov [num], eax
   mov edx, 1
   mov ecx, num
   mov ebx, STDOUT
   mov eax, SYS_WRITE
   int 80h
   
   mov eax, SYS_EXIT
   int 80h
