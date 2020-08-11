global _start

section .text

_start:     mov     ecx, 10

lp_fill:    mov     dword [array + 4*ecx - 4], ecx
;            sub     dword [array + 4*ecx - 4], 1024
            loop    lp_fill

            mov     ecx, 10
            xor     eax, eax

lp_sum:     add     eax, dword [array + 4*ecx - 4]
            loop    lp_sum    
          
            mov     ebx, eax
            mov     eax, 1
            int     0x80

section .bss

array       resd  10 
