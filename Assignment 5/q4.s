.data
        msg1: .asciiz "Enter p: "
        msg2: .asciiz "Enter B line by line: "
        msg3: .asciiz "The sum is "
        msg4: .asciiz "Finish "
        B: .space 40
        Ltwo:   .byte 0x02  # 2 for mod usage

.text
lb $t3, Ltwo
.globl main

        main: 
                # message requesting p as input
                li $v0, 4 
                la $a0, msg1
                syscall

                # read p and store it in $t0
                li $v0, 5
                syscall
                addi $t0 ,$v0, 0

                # check if p == 0
                beqz $t0, finish
                
                # load address of B in $t1
                la $t1, B

                # setup counter in $s0
                li $s0, 0

                # message requesting B as input
                li $v0, 4 
                la $a0, msg2
                syscall
        
        B_in:         
                # read element of B and store it as a floating point integer
                li $v0, 6
                syscall 
                swc1 $f0, 0($t1)

                # move pointer to B ahead
                addi $t1, $t1, 4

                # increment counter and check for loop ending
                addi $s0, $s0, 1
                bne $s0, $t0, B_in

                # reset counter in $s0 if loop is done
                li $s0, 0

        sum: 
                # load floats
                lwc1 $f1, 0($t1) # load from B

                div $s0, $t3 # i mod 2
                mfhi $t6 #stores 0 if $s0 is even and 1 if $s0 is odd
                beq $t6,$zero,L1
                addi $t2,$zero,1
                beq $t6,$t2,L2
                # increment pointers
                addi $t1, $t1, 4

                # increment counter and check for loop ending
                addi $s0, $s0, 1
                bne $s0, $t0, sum

                # message for printing final output
                li $v0, 4
                la $a0, msg3
                syscall
                # load a floating point value from memory
                mov.s $f12, $f0

                li $v0, 2
                syscall

                jr $ra

        L1: 
                li $t0,1
                mtc1 $t0,$f2
                mul.s $f1, $f1, $f2
                add.s $f0, $f0, $f1
        L2: 
                li $t0,-1
                mtc1 $t0,$f2
                mul.s $f1, $f1, $f2
                add.s $f0, $f0, $f1

        finish: 
                # message for printing p == 0
                li $v0, 4
                la $a0, msg4
                syscall

                jr $ra