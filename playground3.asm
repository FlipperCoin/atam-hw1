#.global _start
.global main #need to delete

.section .data #have to delete this part
arr: .int 1,2,3,4,0,5,6
avg: .zero 4



.section .text
#_start:
main:
    movq %rsp, %rbp #for correct debugging #need to deleate
#your code here
    movl $0, avg
    cmpl $0, arr
    je end #if arr[0] = 0  then avg = 0

    #initialize
    xorl %esi, %esi #counter
    xorl %eax, %eax #sum
    
   loop:
    cmpl $0, arr(,%esi,4)
    je divPart
    add arr(,%esi,4), %eax
    incl %esi
    jmp loop
    
   divPart:
    xorl %edx, %edx
    div %esi # %eax = %eax/%esi <==> sum = sum/counter
    movl %eax, avg
    
  end:
    ret #need to delete
    
