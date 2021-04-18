#.global _start
.global main #need to delete

.section .data #have to delete this part
num: .int 8
source: .int 6,12,9,8
destination: .int 1,2,3,4


.section .text
#_start:
main:
    movq %rsp, %rbp #for correct debugging #need to deleate
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
    ret #need to delete
    
