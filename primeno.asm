BITS 32

extern printf
extern scanf

section.data:
         input: db "%d", 0 
         outp1: db "Is prime",10,0
         outp2: db "Not prime",10,0

section.text:
        global main

        main:
        push ebp
        mov ebp, esp
        sub esp, 0x10

        lea eax, [ebp-0x4]
        push eax
        push input
        call scanf
        mov ebx,[ebp-0x4]

        cmp ebx,1
        je isprime

        cmp ebx,2
        je nprime

        mov ecx,2
 
        loop:
             mov edx,0
             mov eax,ebx
             div ecx
             inc ecx
             cmp edx,0
             je nprime
   
             cmp ecx,[ebp-0x4]
             jl loop

        isprime:
            
             push outp1
             call printf

        leave
        ret
 
        nprime:
 
             push outp2
             call printf
 
        leave 
        ret              
 
            
