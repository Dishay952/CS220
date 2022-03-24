.data
    arr: .space 40    
    msg:.asciiz "Enter the 10 Elements of the array : \n"
    nl: .asciiz " "

.text 
      .globl main
main: li $v0,4
      la $a0,msg
      syscall #display msg 
      li $s0,0 #$s0, $zero ; $t0 = 0   index
     
 ArrInp:        
    beq $s0,40,exit #exit when all ten elements have been read 
    li $v0,5
    syscall
    
    sw $v0,arr($s0)
    addi $s0,$s0,4
    j ArrInp

exit:
    jal  insertionSort
    addi $s5,$s5,0
    jal  PrintArr
    li $v0,10
    syscall

insertionSort:  
      #we use nested for and while loop, in the for loop, we increment i(stored in s1 ), and in the while, j(s3).
      addi $s1,$s1,4 # s1= i = 1*4 
            
for: 
      bge	$s1, $s0, ForExit	  # if $s1 >= 10*4 then exit for 
      lw  $s2, arr($s1)  # $s2=key=arr[i]
      addi  $s3,$s1,-4   #s3=j=i-1*4

while: #while(j>=0 && arr[j]>key)
      slti	$t0, $s3, 0		
      beq	 $t0, 1, WhileExit	# if t0 == 1 then exit while 
      lw $t1,arr($s3)
      slt   $t0, $t1,$s2  # if arr[j]<key then t0=1
      beq  $t0,1, WhileExit  # if t0 == 1 then exit while 
      addi  $s4,$s3,4  #s4= j+1*4
      lw   $t2,arr($s3)
      sw  $t2,arr($s4) #arr[j + 1] = arr[j]
      addi  $s3,$s3,-4  #j = j - 1*4
      j    while

ForExit: 
       jr $ra
    

WhileExit:
     addi  $s1,$s1,4   # i=i+1*4 after the end of while loop
     addi $s4,$s3,4  #s4= j+1*4 after whileExit
     sw  $s2,arr($s4) #arr[j+1]=key;
     j   for   #go back to outer for loop 
     
PrintArr:
 Printloop:       
          bge $s5,40, ExitFinal
          li $v0,1
          lw $a0,arr($s5)
          syscall
          li $v0,4
          la $a0,nl 
          syscall #printing space in between the elements of the array 
          addi $s5,$s5,4
          j Printloop
ExitFinal:
    jr $ra

   