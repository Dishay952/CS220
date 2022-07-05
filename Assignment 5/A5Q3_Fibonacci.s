.data
    result: .asciiz "The Fibonacci numbers less than 500 are:\n"
    space:  .asciiz " "
.text
main:
    #show result
    li        $v0, 4
    la        $a0, result
    syscall    
    move      $t4, $0   
    move      $t3, $0  
    loop:     
    bgt       $t4, 500, exit
    li        $v0, 1          # system call #1 - print int
    move      $a0, $t0        # $a0 = $t0
    syscall                   # execute
    la   $a0, space           # load address of space for syscall
    li   $v0, 4               # specify Print String service
    syscall                   # output string           
    addi      $t3, $t3, 1
    #move      $a0, $v0
    move      $a0, $t3
    jal       fib             # jump fibonacci and save position to $ra
    move      $t0, $v0        # $t0 = $v0
    move      $t4, $t0
    j loop
    # return 0
exit: 
    li        $v0, 10        # $v0 = 10
    syscall

.text
fib:
    bgt     $a0, 1, fib_recurse
    move    $v0, $a0
    jr      $ra 
    
fib_recurse:
    addi    $sp, $sp, -12
    sw      $ra, 0($sp)

    sw      $a0, 4($sp) 
    add     $a0, $a0, -1 
    jal     fib
    lw      $a0, 4($sp) 
    sw      $v0, 8($sp)

    add     $a0, $a0, -2
    jal     fib

    lw      $t0, 8($sp)
    add     $v0, $v0, $t0

    lw      $ra, 0($sp)
    add     $sp, $sp, 12
    jr      $ra
