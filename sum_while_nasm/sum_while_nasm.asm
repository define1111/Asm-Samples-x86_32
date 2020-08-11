global _start

section .text

array dw 1, 2, 3, 4, 5, 6, 7, 8, 9

_start: mov     ecx, 9
        xor     eax, eax 

lp:     add     ax, word [array + 2*ecx - 2]
        loop    lp

        mov     ebx, eax
        mov     eax, 1
        int     0x80
