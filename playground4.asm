.global main

.section .data
#arr: .int 6,4,1,9,7,6,3
#n: .int 7
#begin: .int 0
#len: .int 0
arr: .int 6,4,1,9,10,6,3
n: .int 7
begin: .int 0
len: .int 0

.section .text    
ex4:
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
    ret
      
main:
    movq %rsp, %rbp #for correct debugging
    call ex4
    ret
