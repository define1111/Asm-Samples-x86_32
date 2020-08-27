global _start

section .data

string db "Hello world!", 0                     ; non-constant string for reverse
string_len equ $-string                         ; len of string

section .text
_start:         xor     eax, eax                ; eax = 0

                mov     esi, string             ; esi = string

lp:             mov     al, [esi]               ; al = *esi
                cmp     al, 0                   ; if al == 0 go to lpq (loop quit)
                je      lpq                         
                push    eax                     ; push eax
                inc     esi                     ; ++esi 
                jmp     lp                      ; go to lp (loop)

lpq:            mov     edi, string             ; edi = string

lp2:            pop     eax                     ; pop eax
                cmp     eax, 0                  ; if eax == 0 go to lp2q (loop2 quit)
                je      lp2q
                mov     [edi], al               ; *edi = al
                inc     edi                     ; ++edi
                jmp     lp2                     ; go to lp2 (loop2)

lp2q:           mov     eax, 4                  ; write string and quit
                mov     ebx, 1
                mov     ecx, string
                mov     edx, string_len
                int     0x80

                mov     eax, 1
                mov     ebx, 0
                int     0x80
                
