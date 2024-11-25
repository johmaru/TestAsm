.386
.model flat, stdcall
option casemap :none

include \masm32\include\masm32rt.inc

.data
    msg db "Hello, World!", 0

.code
start:
    invoke MessageBoxA, NULL, addr msg, addr msg, MB_OK
    invoke ExitProcess, 0

end start
