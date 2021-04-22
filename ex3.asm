.global _start

.section .text
_start:
#your code here
    movq $arr, %rbx
    movl $0, %ecx
    xor %rax, %rax
    xor %rdx, %rdx
loop:
    movl 0(%rbx,%rcx,4), %edx
    test %edx, %edx
    je comp_avg
    
    addq %rdx, %rax
    inc %ecx
    jmp loop

comp_avg:
    test %ecx, %ecx
    je end
    xor %rdx, %rdx
    movq %rax, %rdx
    shrq $32, %rdx
    div %ecx
end:
    movl %eax, (avg)
