.data
	greeting: .asciiz "Welcome to the Work Calculator\n"
	numHW: .asciiz "Enter the number of homeworks: "
	avgHwTime: .asciiz "Enter the avergae time to complete each homework: "
	numEx: .asciiz "Enter the number of excersizes: "
	avgExTime: .asciiz "Enter the average time to complete each exercise: "
	
	
.text
	li $v0, 4
	la $a0, greeting
	syscall

	main:
		li $v0, 4
		la $a0, numHW
		syscall
		li $v0, 5
		syscall
		move $t0, $v0
		
		li $v0, 4
		la $a0, avgHwTime
		syscall
		li $v0, 5
		syscall
		move $t1, $v0
		
		li $v0, 4
		la $a0, numEx
		syscall
		li $v0, 5
		syscall
		move $t2, $v0
		
		li $v0, 4
		la $a0, avgExTime
		syscall
		li $v0, 5
		syscall
		move $t3, $v0
		
		move $a0, $t0
		move $a1, $t1
		move $a2, $t2
		move $a3, $t3
		jal hw_time
		move $t0, $v0
		move $a0, $t0
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall
		
	hw_time: 
		addi $sp, $sp -8
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		
		mul $v0, $a0, $a1
		move $t0, $v0
		mul $v0, $a2, $a3
		move $t1, $v0
		add $v0, $t0, $t1
		
		lw $t0, 0($sp)
		lw $t1, 4($sp)
		addi $sp, $sp, 8
		
		jr $ra
	
