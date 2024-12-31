.386
.model flat, stdcall
option casemap : none
.code
; Shellcode simple (x86): Infinite loop
global _start
section .text
_start:
    jmp $
end