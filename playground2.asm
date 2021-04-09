.global main

.section .data
source: .int 6,12,9,8
destination: .int 1,2,3,4 # expected: .int 6,12,3,4
num: .int 8

.section .text    
ex2:
    movq $source, %rsi
    movq $destination, %rdi
    
    movl (num), %ecx
    test %ecx, %ecx
    jl end
    
    rep movsb
    
end:
    ret
      
main:
    movq %rsp, %rbp #for correct debugging
    call ex2
    ret
