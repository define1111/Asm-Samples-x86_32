global _start

section .data
iter db 5                                       ; char iter = 5

section .text
hello_world_msg db  "Hello, World!", 10, 0      ; store constant string in section .text is better
hw_msg_len      equ $-hello_world_msg           ; store constant lenght of string

_start: cmp     byte [iter], 0                  ; compare varibale iter with 0
        jz      quit                            ; if iter == 0 go to quit

        mov     eax, 4                          ; sys_write
        mov     ebx, 1                          ; stdout
        mov     ecx, hello_world_msg            ; pointer to string
        mov     edx, hw_msg_len                 ; lenght of string
        int     0x80                            ; syscall

        dec     byte [iter]                     ; --iter

        jmp     _start                          ; go to _start

quit:   mov     eax, 1                          ; sys_exit
        mov     ebx, 0                          ; exit return code
        int     0x80                            ; syscall
