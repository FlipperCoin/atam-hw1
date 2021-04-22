.global main

.section .data
arr: .int 0xFFFFFFF0,0xFFFFFFF4,0xFFFFFFF2,0
avg: .zero 4

.section .text    
ex3:
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
    ret
main:
    movq %rsp, %rbp #for correct debugging
    call ex3
    ret
