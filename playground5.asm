#.global _start
.global main #need to delete

.section .data #have to delete this part
head: .quad CNode
src: .quad 5
dst: .quad 4
CNode:  .quad 6
    .quad ANode
BNode:  .quad 4
    .quad NULL
ANode:  .quad 5
    .quad BNode
.set NULL, 0


.section .text
#_start:
main:
    movq %rsp, %rbp #for correct debugging #need to deleate
#your code here
   #initialize
   movq head, %rax #src pointer
   movq $head, %rbx
   movq src, %rsi # tmp = src
   
  FindSrc:
    cmpq $0, %rax
    je end #if rax==NULL end
    cmpq %rsi, (%rax) #if *rax==src
    je FindDest
    movq %rax, %rbx #ptr2 = src ptr
    movq 8(%rax), %rax #ptr = ptr->next
    jmp FindSrc
    
   FindDest:
    cmpq $0, 8(%rax)
    je end #if we foud src but it is the last node goto end
    movq %rax, %rcx #ptr3 = ptr
    movq 8(%rcx), %rdx #dest pointer = src pointer->next
    movq dst, %rsi # tmp = dst
   FindLoop:
    cmpq $0, %rdx #if rdx==NULL end
    je end
    cmpq %rsi, (%rdx)
    je Switch #if *rdx==dest
    movq %rdx, %rcx # ptr3 = dst ptr
    movq 8(%rdx), %rdx #dest ptr = dest ptr->next
    jmp FindLoop
    
   Switch:
    cmpq $head, %rbx #if we need to replace the first node       
    je FirstNodeSwitch
    movq %rdx, 8(%rbx)#else it is a regular node
    
   Continue:
    movq %rax, 8(%rcx)
    movq 8(%rax), %rsi # tmp = src ptr->next
    movq 8(%rdx), %rbx # tmp2 = dst ptr->next
    movq %rsi, 8(%rdx)
    movq %rbx, 8(%rax)
    jmp end
    
   FirstNodeSwitch:
    movq %rdx, head
    jmp Continue
    
  end:
    ret #need to delete
    
