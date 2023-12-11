.data
	greeting: .asciiz "Enter three positive integers sepearated by the enter key:\n"
	
.text
	la $a0, greeting
	li $v0, 4
	syscall
		
	li $v0, 5
	syscall
	move $t0, $v0
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 5
	syscall
	move $t2, $v0
	
	#find smallest number between first two
	beqz $t0, secNumLastNum
	beqz $t1, firstNumLastNum
	blt $t0, $t1, firstNumLastNum
	blt $t1, $t0, secNumLastNum
		
	#if first num is less than second num
	firstNumLastNum:
		beqz $t2, firstNum
		blt $t0, $t2, firstNum
		blt $t2, $t0, lastNum
		
	#if second num us less than first num
	secNumLastNum:
		beqz $t2, secNum
		blt $t1, $t2, secNum
		blt $t2, $t1, lastNum
		
	firstNum:
		move $a0, $t0
		j end
	
	secNum:
		move $a0, $t1
		j end
	
	lastNum:
		move $a0, $t2
		j end
	end:
		li $v0, 1
		syscall
		li $v0, 10
		syscall
		
