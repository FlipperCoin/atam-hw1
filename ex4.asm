.global _start

.section .text
_start:
#your code here
    xor %r9, %r9 # seq_begin
    xor %r10, %r10 # seq_len
    movl $0, (len)
    movl $0, (begin)
    
    xor %rcx, %rcx
    
    movl (n), %edi
    test %edi, %edi
    je end
    
    movl $1, (len)
    movq $1, %r10
    decl %edi
    
loop:
    cmpl %edi, %ecx
    jae end
    
    movq $arr, %rbx
    movl (%rbx,%rcx,4), %eax
    movl 4(%rbx,%rcx,4), %edx
    cmpl %edx, %eax 
    ja seq_inc # if (arr[i] > arr[i+1])
    movq %rcx, %r9 
    incq %r9 # seq_begin = i+1
    movq $1, %r10 # seq_len = 1
    jmp try_swap
seq_inc:
    incq %r10
try_swap:
    movq %r9, %rax
    movq %r10, %rdx
    cmpl (len), %edx
    jbe continue
    movl %edx, (len)
    movl %eax, (begin)
continue:
    inc %ecx
    jmp loop    
end: