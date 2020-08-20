global _start

section .text
hello_world_msg db  "Hello, World!", 10, 0      ; store string in section .text
hw_msg_len      equ $-hello_world_msg           ; string length

_start: mov ecx, 5                              ; put 5 to ecx

lp:     mov     eax, 4                          ; sys_write
        mov     ebx, 1                          ; stdout
        push    ecx                             ; safe ecx on stack
        mov     ecx, hello_world_msg            ; put pointer to string to ecx
        mov     edx, hw_msg_len                 ; string length
        int     0x80                            ; syscall
        
        pop     ecx                             ; return saved ecx
        loop    lp                              ; go to lp if ecx != 0

        mov     eax, 1                          ; sys_exit
        mov     ebx, 0                          ; exit return code
        int     0x80                            ; syscall
