.data
	greeting: .asciiz "Enter three signed numbers separated by the enter key:\n"
	fout: .asciiz "f = "
	overflow: .asciiz "\nOverflow"
	noOverflow: .asciiz "\nNo Overflow"
	divZ: .asciiz "Division by Zero"
.text
	la $a0, greeting
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0 # value of a
	
	li $v0, 5
	syscall
	move $s1, $v0 # value of b

	li $v0, 5
	syscall
	move $s2, $v0 # value of c
	
	# b^c
	move $t0, $s1
	move $t1, $s2
	li $t2, 1
	loop: beq $t1, $zero, end
		mul $t2, $t2, $t0
		sub $t1, $t1, 1
		j loop
	
	end:
		move $s3, $t2
		
	
	# a^2
	move $t3, $s0
	mul $t4, $t3, $t3
	move $s4, $t4
	
	# find out if denom is zero
	sub $t5, $s2, $s4
	beq $t5, $zero, divZero
	
	# a + b^c
	add $t6, $s0, $s3
	
	# num/denom
	div $t7, $t6, $t5
	mflo $t8
	move $s5, $t8
	
	# 3*b
	add $t9, $s1, $s1
	add $t9, $t9, $s1
	move $s6, $t9
	
	# f= 
	add $t0, $s5, $s6
	move $s7, $t0
	
	# Overflow check
	bgt $s7, 32767, printOverflow
	blt $s7, -32767, printOverflow
	
	li $v0, 1
	move $a0, $s7
	syscall
	
	li $v0, 4
	la $a0, noOverflow
	syscall
	
	j exit
	
	divZero:
		li $v0, 4
		la $a0, divZ
		syscall
		
		j exit
	
	printOverflow:
		li $v0, 4
		la $a0, overflow
		syscall
		
		j exit
		
	exit: 
		li $v0, 10
		syscall
		