global _start

section .data
hello_world_msg db  "Hello, World!", 10, 0      ; It is not good to store a constant string in the data section, 
                                                ; but for the first time so be it
hw_msg_len      equ $-hello_world_msg           ; variable with string length

section .text
_start: mov     eax, 4                          ; system call number (sys_write)
        mov     ebx, 1                          ; file descriptor (stdout)
        mov     ecx, hello_world_msg            ; pointer to string
        mov     edx, hw_msg_len                 ; length of string
        int     0x80                            ; legacy syscall in x86_32

        mov     eax, 1                          ; (sys_exit)
        mov     ebx, 0                          ; exit return code
        int     0x80
