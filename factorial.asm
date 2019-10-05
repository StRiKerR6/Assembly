BITS 32

extern printf
extern scanf

section.data:
         input: db "%d", 0 
         outp1: db "%d", 10, 0
         

section.text:
        global main

        main:
        push ebp
        mov ebp, esp
        sub esp, 0x10

        lea ebx, [ebp-0x4]
        push ebx
        push input
        call scanf
        mov ebx,dword[ebp-0x4] 

        mov eax, 1
        mov ecx, 1

        loop:
            mul ebx
            dec ebx
            inc ecx
            cmp ecx,dword[ebp-0x4]
            jle loop

        push eax
        push outp1
        call printf 
        
        leave
 
        ret


