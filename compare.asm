global _start

section .data  
    A db 21
    B db 15
    C db 255
    largestNum db 0
    largestInput db '0'

section .text
_start:
    mov al, 0
    mov al, byte[A]
    cmp al, byte[B]
    ja above1
    jb above2
    jmp exit_here

above1: 
    mov al, byte[A]
    cmp al, byte[C]
    ja highest1
    mov al, byte[C]
    mov byte[largestNum], al
    mov byte[largestInput], 'C'
    jmp exit_here

above2:
    mov al, byte[B]
    cmp al, byte[C]
    ja highest2
    mov al, byte[C]
    mov byte[largestNum], al
    mov byte[largestInput], 'C'
    jmp exit_here

highest1: 
    mov al, byte[A]
    mov byte[largestInput], 'A'
    mov byte[largestNum], al
    jmp exit_here

highest2: 
    mov al, byte[B]
    mov byte[largestNum], al
    mov byte[largestInput], 'B'

exit_here:
    mov rax, 60
    xor rdi, rdi
    syscall