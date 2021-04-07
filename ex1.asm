.global _start

.section .text
_start:
#your code here
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