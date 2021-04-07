.global _start

.section .text
_start:
#your code here
    movq $arr, %rbx
    movl $0, %ecx
    xor %rax, %rax
loop:
    movl 0(%rbx,%rcx,4), %edx
    test %edx, %edx
    je comp_avg
    
    addl %edx, %eax
    inc %ecx
    jmp loop

comp_avg:
    test %ecx, %ecx
    je end
    xor %rdx, %rdx
    div %ecx
end:
    movl %eax, (avg)