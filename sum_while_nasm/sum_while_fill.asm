global _start

section .text

_start:     mov     ecx, 10                             ; ecx = 10

lp_fill:    mov     dword [array + 4*ecx - 4], ecx      ; array[ecx-1] = ecx
            loop    lp_fill                             ; --ecx and if ecx != 0 go to lp_fill

            mov     ecx, 10                             ; ecx = 10
            xor     eax, eax                            ; eax = 0

lp_sum:     add     eax, dword [array + 4*ecx - 4]      ; eax += array[ecx-1]
            loop    lp_sum                              ; --ecx and if ecx != 0 go to lp_sum
          
            mov     ebx, eax                            ; ebx = sum of array
            mov     eax, 1                              ; sys_exit
            int     0x80                                ; syscall

section .bss

array       resd  10                                    ; pointer to reserved 10 cells of 4-bytes cells
