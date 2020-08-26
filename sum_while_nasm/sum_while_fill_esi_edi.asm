global _start

section .text

_start:     mov     ecx, 10                             ; ecx = 10
            mov     edi, array                          ; pointer to destination = array
            cld                                         ; clear direction flag

lp_fill:    mov     eax, ecx                            ; eax = ecx
            stosd                                       ; [edi] = eax; edi += 4 // *array = eax; *array += 1
            loop    lp_fill                             ; --ecx and if ecx != 0 go to lp_fill


            mov     ecx, 10                             ; ecx = 10
            xor     ebx, ebx                            ; eax = 0

            mov     esi, array                          ; pointer to source = array
lp_sum:     lodsd                                       ; eax = [esi]; esi += 4 // eax = *array; *array += 1
            add     ebx, eax                            ; ebx += eax
            loop    lp_sum                              ; --ecx and if ecx != 0 go to lp_sum
          
            mov     eax, 1                              ; sys_exit
            int     0x80                                ; syscall

section .bss

array       resd  10                                    ; pointer to reserved 10 cells of 4-bytes cells
