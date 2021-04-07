.global main

.section .data
arr: .int 1,2,3,4,5,6,0,9,10
avg: .zero 4

.section .text    
ex3:
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
    ret
main:
    movq %rsp, %rbp #for correct debugging
    call ex3
    ret
