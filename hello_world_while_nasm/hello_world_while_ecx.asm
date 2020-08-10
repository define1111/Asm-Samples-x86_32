global _start

section .text
hello_world_msg db  "Hello, World!", 10, 0
hw_msg_len      equ $-hello_world_msg

_start: mov ecx, 5

lp:     mov     eax, 4
        mov     ebx, 1
        push    ecx
        mov     ecx, hello_world_msg
        mov     edx, hw_msg_len
        int     0x80
        
        pop     ecx
        loop    lp

quit:   mov     eax, 1
        mov     ebx, 0
        int     0x80
