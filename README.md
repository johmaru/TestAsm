# 使い方
windows :
``` nasm -f win64 hello.asm -o hello.obj ```

``` gcc -o hello.exe hello.obj ```

linux : 
```nasm -f elf64 linuxhello.asm -o linuxhello.obj```
```ld linuxhello.obj -o linuxhello```
# 勉強

https://learn.microsoft.com/ja-jp/cpp/build/x64-calling-convention?view=msvc-170

https://learn.microsoft.com/ja-jp/windows/win32/api/

https://learn.microsoft.com/ja-jp/cpp/assembler/masm/microsoft-macro-assembler-reference?view=msvc-170

https://learn.microsoft.com/ja-jp/windows/win32/debug/pe-format

# Linux

https://www.mztn.org/lxasm64/amd00.html