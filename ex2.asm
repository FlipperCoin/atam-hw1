.global _start

.section .text
_start:
#your code here
#your code here
    movl num, %esi
    xorq %rax,%rax
    cmpl $0, %esi #if num<=0 do nothing
    jle end
    movsxl %esi ,%rbx
    addq $source, %rbx 
    movsxl %esi ,%rdx
    addq $destination, %rdx
      loop:
       movb -1(%rbx), %al 
       movb %al, -1(%rdx) #moves 1 byte from source to dest
       
       decq %rbx #updates the values
       decq %rdx
       decl %esi
       je end #if num=0 we finished
       jmp loop #else continue
       
    
    
  end: