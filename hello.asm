extern ExitProcess
extern GetStdHandle
extern WriteConsoleA

section .data
    hello db "Hello, World!", 0
    written dd 0

section .text
    global main

main:
   push rbp
   mov rbp, rsp

   ; Get stdout handle
   mov rcx, -11 ; Windowsではrcxが第一引数
   call GetStdHandle

    ; Write to stdout
    mov rcx, rax ; raxはGetStdHandleの戻り値(Raxは関数の戻り値を格納するレジスタ)
    mov rdx, hello ; rdxは第二引数
    mov r8, 13 ; r8は第三引数
    mov r9, written ; r9は第四引数
    push 0 ; 第五引数(使用しないので予約済みとして0をプッシュ)
    call WriteConsoleA

    ; Exit
    xor rcx, rcx ; rcxとrcxが等しい場合は0を返す
    call ExitProcess