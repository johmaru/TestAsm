section .data
    path db "hello.asm", 0
    pathlen equ $-path
    msg_exist db " exists", 0xa
    existlen equ $-msg_exist
    msg_notexist db " does not exist", 0xa
    notexistlen equ $-msg_notexist

section .text
    global _start


_start:
    mov rax, 21
    mov rdi, path
    mov rsi, 0
    syscall

    cmp rax, 0
    jge file_exist
    jmp file_notexist

file_exist:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_exist
    mov rdx, existlen
    syscall
    jmp exit

file_notexist:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_notexist
    mov rdx, notexistlen
    syscall

exit:
mov rax, 60
xor rdi, rdi
syscall    
