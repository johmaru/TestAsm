section .data
    prompt db "Enter your name: ", 0
    promptlen equ $-prompt
    greeting db "Hello, ", 0
    greetinglen equ $-greeting

section .bss
       buffer resb 255
       bufferlen equ $-buffer

section .text
    global _start


_start:
    ;プロンプト

    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov rdx, promptlen
    syscall    

    ; ユーザー入力  

    mov rax, 0
    mov rdi, 0
    mov rsi, buffer
    mov rdx, bufferlen
    syscall

    ;挨拶

    mov rax, 1
    mov rdi, 1
    mov rsi, greeting
    mov rdx, greetinglen
    syscall

    ;ユーザー入力を出力
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, bufferlen
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall