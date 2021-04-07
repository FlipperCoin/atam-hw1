.global main

.section .data
source: .int 6,12,9,8
destination: .int 1,2,3,4 # expected: .int 6,12,3,4

.section .text    
ex3:
    

main:
    movq %rsp, %rbp #for correct debugging
    call ex2
    ret
