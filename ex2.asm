.global _start

.section .text
_start:
#your code here
    xorq %rax,%rax
    cmpl $0, num #if num<=0 do nothing
    jle end
    movsxl num ,%rbx
    addq $source, %rbx 
    movsxl num ,%rdx
    addq $destination, %rdx
      loop:
       movb -1(%rbx), %al 
       movb %al, -1(%rdx) #moves 1 byte from source to dest
       
       decq %rbx #updates the values
       decq %rdx
       decl num
       je end #if num=0 we finished
       jmp loop #else continue
       
    end:
