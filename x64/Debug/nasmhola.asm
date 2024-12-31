section .text
    global main

main:

.load_user32dll:
    xor rax, rax                ; Store RAX as 0 for reusing purpose
   push rax                    ; Push null byte into stack for string termination
    mov rbx, 0x6c6c414141414141 ; 'll' padded with 'AAAAAA' for avoiding null byte
    shr rbx, 48                 ; Right byte shift operation to remove 'AAAAAA'
    push rbx                    ; Pushing it into stack
    mov rbx, 0x642e323372657375 ; 'user32.d' 
    push rbx                    ; Pushing it into stack
    mov rcx, rsp                ; Storing the DllName - LPCSTR lpLibFileName
    mov rbx, 0x7FFA4E090C704141 ; LoadLibraryA address padded with 'AA'
   shr rbx, 16                 ; Right byte shift operation to remove 'AA'
    call rbx                    ; Call LoadLibraryA("user32.dll")

.message_box:
    push rax                    ; Null byte for string termination
    mov rbx, 0x756f792064656e77 ; 'wned you'
    push rbx                    ; Pushing it into stack
    mov rbx, 0x7020393633656372 ; 'rce369 p'
    push rbx                    ; Pushing it into stack
    mov rbx, 0x6165706e65646961 ; 'aidenpea'
    push rbx                    ; Pushing it into stack
    mov rdx, rsp                ; Storing the LPCSTR lpText
    push rax                    ; Null byte for string termination
    mov rbx, 0x64656b6361687830 ; '0xhacked'
    push rbx                    ; Pushing it into stack
    mov r8, rsp                 ; Storing the LPCSTR lpCaption
    xor rcx, rcx                ; HWND hWnd = 0
    xor r9, r9                  ; UINT uType = 0
    mov rbx, 0x7FFA4EE990D04141 ; MessageBoxA address padded with 'AA'
    shr rbx, 16                 ; Right byte shift operation to remove 'AA'
    call rbx                    ; Call MessageBoxA(...)

.exit_process:
    xor rcx, rcx                ; UINT uExitCode = 0
    mov rbx, 0x7FFA4E08E8204141 ; ExitProcess address padded with 'AA'
    shr rbx, 16                 ; Right byte shift operation to remove 'AA'
    call rbx                    ; Call ExitProcess(0)
