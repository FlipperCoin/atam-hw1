.global main

.section .data
num: .quad 0x202
countBits:  .zero 4

.section .text    
ex1:
    movq num, %rax
    xor %rbx, %rbx
loop:
    test %rax, %rax
    je end
    inc %rbx
    
    mov %rax, %rdx
    decq %rax
    andq %rdx, %rax
    
    jmp loop
end:
    movq %rbx, countBits    
    ret

main:
    movq %rsp, %rbp #for correct debugging
    #call ex2
    xor %rax, %rax
    movl $0xFFFFFFFF, %eax
    addl $1, %eax
    ret
