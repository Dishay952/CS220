.data
        message1: .asciiz "Enter p: "
        message2: .asciiz "Enter B line by line: "
        message3: .asciiz "Enter Y line by line: "
        message4: .asciiz "The Result is: "
        X: .space 60

.text
.globl main

        main: 
                # message requesting p as input
                li $v0, 4 
                la $a0, message1
                syscall

                # read p and store it in $t0
                li $v0, 5
                syscall
                addi $t0 ,$v0, 0

                # check if n == 0
                beqz $t0, finish
                
                # load address of B in $t1
                la $t1, X 
    
                # setup counter in $s0
                li $s0, 0

                # message requesting B as input
                li $v0, 4 
                la $a0, message2
                syscall
        
        X_in:         
                # read element of B and store it
                li $v0, 6
                syscall 
                swc1 $f0, 0($t1)

                # move pointer to B ahead
                addi $t1, $t1, 4

                # increment counter and check for loop ending
                addi $s0, $s0, 1
                bne $s0, $t0, X_in

                # reset counter in $s0 if loop is done
                li $s0, 0


        Y_in:                 
                
                # reset pointers to B
                la $t1, X
                

                # make accumulator f0 for total sum
                li $t3, 0
                mtc1 $t3, $f0

                
        dot_prod: 
                # load floats
                lwc1 $f1, 0($t1) # load from B
                
                li.s $f2, 1.0
                andi $t4,$s0, 1
                bne $t4,$zero,else
                
                mul.s $f1, $f1, $f2
                add.s $f0, $f0, $f1

                # increment pointers
                addi $t1, $t1, 4
                
                # increment counter and check for loop ending
                addi $s0, $s0, 1
                bne $s0, $t0, dot_prod
                beq $s0,$t0,finish

                
        else:
                li.s $f2, -1.0
                # multiply and add to accumulator
                mul.s $f1, $f1, $f2
                add.s $f0, $f0, $f1

                # increment pointers
                addi $t1, $t1, 4
               

                # increment counter and check for loop ending
                addi $s0, $s0, 1
                bne $s0, $t0, dot_prod
                beq $s0,$t0,finish

               

        finish: 

                li $v0, 4
                la $a0, message4
                syscall

                mov.s $f12, $f0

                li $v0, 2
                syscall

                jr $ra