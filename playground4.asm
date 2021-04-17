#.global _start
.global main #need to delete

.section .data #need to delete
arr: .int 1,2,1,3,2,1,1,2,3
n: .int 9
begin: .int 0
len: .int 0

.section .text
#_start:
main:
    movq %rsp, %rbp #for correct debugging #need to deleate
#your code here

  cmp $0, n #if n==0
  je end

  movq $arr,%rax #initialize - array pointer
  movl $1,%ebx #max len
  movl $1,%ecx #current len
  movq %rax,%rsi #current begin
  movl $0, begin
  movl $0, len
  
   
  
  loop:
    cmpl $1, n # while(n>0)
    jle end
    movl (%rax), %edx 
    cmp %edx, 4(%rax) # if(arr[i] < arr[i+1])
    jge end_of_sires
    incl %ecx
    cmpl %ebx, %ecx
    jg new_max
  update_counter:
    addq $4, %rax
    decl n
    jmp loop
  
    
  new_max:
    movl %ecx, %ebx #update max len
    movq %rsi, %r8
    subq $arr, %r8
    shrq $2, %r8
    movl %r8d, begin #update begin (max begin)
    jmp update_counter
    
    
  end_of_sires:
    addq $4, %rax
    decl n
    movq %rax, %rsi #update current begin
    movl $1, %ecx #update current len
    jmp loop 
    
  end:
    movl %ebx, len
    ret #need to delete
    
