.global _start

.section .text
_start:
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
  
