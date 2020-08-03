global _start

section .data
hello_world_msg db  "Hello, World!", 10, 0
hw_msg_len      equ $-hello_world_msg

section .text
_start: mov     eax, 4
        mov     ebx, 1
        mov     ecx, hello_world_msg
        mov     edx, hw_msg_len
        int     80h

        mov     eax, 1
        mov     ebx, 0
        int     80h
