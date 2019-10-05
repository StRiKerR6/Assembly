BITS 32

extern printf
extern scanf

section.data:
        input: db "%d", 0 
        output: db "%d",10,0

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
        mov ebx, [ebp-0x4]
 
        cmp ebx,1
        je fib1
 
        cmp ebx,2
        je fib2

        mov eax,0
        mov ebx,1
        mov ecx,0
        mov edx,0
        
        loop:

           mov eax, ebx
           mov ebx, ecx
           add eax, ebx 
           add ecx, eax
           push ecx
           push output
           call printf
           inc edx
           cmp edx,[ebp-0x4]
           jl loop
 
       fib1:
           push 0
           push output
           call printf
    
       leave

       ret


       fib2:
            push 0
            push output
            call printf
            push 1
            push output
            call printf 

        leave

        ret


        leave
        ret
