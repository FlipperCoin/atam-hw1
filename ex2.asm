.global _start

.section .text
_start:
#your code here
    xorq %rax,%rax
    cmpl $0, num #if num<=0 do nothing
    jle end
    movq $source, %rbx 
    movq $destination, %rdx
  loop:
       movb (%rbx), %al 
       movb %al, (%rdx) #moves 1 byte from source to dest
       
       incq %rbx #updates the values
       incq %rdx
       decl num
       je end #if num=0 we finished
       jmp loop #else continue
           
  end:
