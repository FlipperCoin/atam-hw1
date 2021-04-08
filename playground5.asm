.global main

.section .data
head: .quad ANode
src: .quad 5
dst: .quad 4
FNode:  .quad -6
        .quad NULL
ENode:  .quad 66
        .quad FNode
DNode:  .quad 0x45FFFFFFFF
        .quad ENode
CNode:  .quad 0
        .quad DNode
BNode:  .quad 4
        .quad CNode
ANode:  .quad 5
        .quad BNode
        .set NULL, 0

.section .text    
ex5:
    movq (head), %rsi # s = head
    xor %r9, %r9 # b_s = NULL
    
    xor %rdi, %rdi # d = NULL
    xor %r10, %r10 # b_d = NULL

loop_s:
    test %rsi, %rsi
    je end
    
    movq (%rsi), %rax
    cmpq %rax, (src)
    je search_d
    
    movq %rsi, %r9
    movq 8(%rsi), %rsi
    jmp loop_s
    
search_d:
    movq %rsi, %r10
    movq 8(%rsi), %rdi
loop_d:
    test %rdi, %rdi
    je end
    
    movq (%rdi), %rax
    cmpq %rax, (dst)
    je swap    
    
    movq %rdi, %r10
    movq 8(%rdi), %rdi
    jmp loop_d 
    
swap:
    movq 8(%rsi), %r11 # prev_s_next = s->next
    movq 8(%rdi), %rax
    movq %rax, 8(%rsi) # s->next = d->next
    
    test %r9, %r9 # if (b_s == NULL)
    je head_d
    movq %rdi, 8(%r9) # b_s->next = d
    jmp endif
head_d:
    movq %rdi, (head) # head = d
endif:
    
    cmpq %r11, %rdi # if (prev_s_next == d)
    je swap_sd
    movq %r11, 8(%rdi) # d->next = prev_s_next
    jmp endif2
swap_sd:
    movq %rsi, 8(%rdi) # d->next = s
endif2:
    
    cmpq %r10, %rsi # if (b_d != s)
    je end
    movq %rsi, 8(%r10)
end:
    ret

old_ex5:
    movq (head), %rax
    xor %rsi, %rsi
old_loop:
    test %rax, %rax
    je old_end
    
    movq (%rax), %rdx
    cmpq %rdx, (dst)
    je old_swap
    
    cmpq %rdx, (src)
    jne old_iter    
    movq %rax, %rsi
old_iter:
    movq 8(%rax), %rax
    jmp old_loop
    
old_swap:
    test %rsi, %rsi
    je end
    movq %rdx, (%rsi) # %rdx still holds (dst)
    movq (src), %rdx
    movq %rdx, (%rax) # %rax still holds dst
old_end:
    ret
    
main:
    movq %rsp, %rbp #for correct debugging
    call ex5
    ret
