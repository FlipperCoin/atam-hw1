#.global _start
.global main #need to delete

.section .data #have to delete this part
num: .quad 0x0
countBits: .zero 4


.section .text
#_start:
main:
    movq %rsp, %rbp #for correct debugging #need to deleate
#your code here
    movl $0, countBits #intilaze
    movq num, %rax
    
  loop:
    test %rax, %rax
    je end
    
    shr %rax
    jc addOne
    jmp loop
  
  addOne:
    incl countBits
    jmp loop
    
  end:
    ret #need to delete
    
