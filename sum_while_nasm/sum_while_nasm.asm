global _start

section .text

array dw 1, 2, 3, 4, 5, 6, 7, 8, 9                  ; constant array

_start: mov     ecx, 9                              ; put length of array to ecx
        xor     eax, eax                            ; eax = 0 (and ax = 0 too)

lp:     add     ax, word [array + 2*ecx - 2]        ; ax += array[ecx-1] // *(array + (ecx - 1))
                                                    ; 2*ecx this coef needs becouze C compiler
                                                    ; automatically calculates the offset of the array cell,
                                                    ; and we are forced to multiply it explicity

        loop    lp                                  ; --ecx and if ecx != 0 go to lp

        mov     ebx, eax                            ; summ of array go to return exit code
                                                    ; (check it by command $ echo $?)
        mov     eax, 1                              ; sys_exit
        int     0x80                                ; syscall
