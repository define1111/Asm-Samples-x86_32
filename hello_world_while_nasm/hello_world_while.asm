global _start

section .data
iter db 5

section .text
hello_world_msg db  "Hello, World!", 10, 0
hw_msg_len      equ $-hello_world_msg

_start: cmp     byte [iter], 0
        jz      quit

        mov     eax, 4
        mov     ebx, 1
        mov     ecx, hello_world_msg
        mov     edx, hw_msg_len
        int     0x80

        dec     byte [iter]

        jmp     _start

quit:   mov     eax, 1
        mov     ebx, 0
        int     0x80
