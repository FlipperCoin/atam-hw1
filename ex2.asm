.global _start

.section .text
_start:
#your code here
    movq $source, %rsi
    movq $destination, %rdi
    
    movl (num), %ecx
    test %ecx, %ecx
    jl end
    
    rep movsb
    
end: