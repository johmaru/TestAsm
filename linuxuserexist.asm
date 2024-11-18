section .bss
    buffer resb 255
    bufferlen equ $-buffer


section .data
    msg_exist db " exists", 0xa
    existlen equ $-msg_exist
    msg_notexist db " does not exist", 0xa
    notexistlen equ $-msg_notexist
    prompt db "Enter file: ", 0
    promptlen equ $-prompt

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov rdx, promptlen
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, buffer ;受け取った文字列は最後に0xaが入っているので、それを0に変更する
    mov rdx, bufferlen
    syscall

    mov r8, rax

    mov byte [buffer + r8 -1],0

    jmp check
   

check:
    mov rax, 21
    mov rdi, buffer
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
