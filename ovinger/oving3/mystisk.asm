cr equ 13
lf equ 10
SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1
STDERR equ 2
ytre equ 20
indre equ 10

section .data
    crlf db cr, lf
    crlflen equ $ - crlf

section	.bss
    num resb 1

section	.text
   global _start        
	
_start:	  
    mov edx, ytre
    mov ebx, indre
    mov ecx, 1
comp:
    cmp ecx, edx
    jl ink
    jg dek
    je fin
    
    
ink:
    inc ecx
    jmp comp
	
dek:    
    dec ecx
    jmp comp

    
fin:
   call nylinje
   mov [num], eax
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov eax,1            
   int 0x80
   
; Flytt cursor helt til venstre på neste linje
nylinje:
	push eax
	push ebx
	push ecx
	push edx
	mov edx,crlflen
	mov ecx,crlf
	mov ebx,STDOUT
	mov eax,SYS_WRITE
	int 80h
	pop edx
	pop ecx
	pop ebx
	pop eax
	ret
