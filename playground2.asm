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
    ret #need to delete
    
