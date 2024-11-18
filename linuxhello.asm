;rax - 戻り値、システムコール番号
;rbx - ベースレジスタ
;rcx - カウンタ
;rdx - データレジスタ
;rsi - ソースインデックス
;rdi - デスティネーションインデックス
;rsp - スタックポインタ
;rbp - ベースポインタ


bits 64
section .text
global _start

section .data
    hello db "Hello, World!", 0xa
    len equ $-hello

section .text
    global _start    

_start:
     mov rax, 1    ;システムコール番号 
     mov rdi, 1    ;ファイルディスクリプタ
     mov rsi, hello ;出力文字列 
     mov rdx, len  ;文字列長 
     syscall       ;システムコール

     mov rax, 60   ;システムコール番号
     xor rdi, rdi  ;終了コード0
     syscall       ;システムコール