.data
startMessage: .asciiz "Loop starts\n"
endMessage: .asciiz "Loop ends\n"
newLine: .asciiz "\n"
array: .space 40

.text
li $v0, 4
la $a0, startMessage
syscall

# array index starts at 10
addi $s0, $zero, 0

Loop: bgtz $t1, exit
	addi $t0, $t0, 4
	sw $t1, array($s0)
	
	addi $t2, $t1, 2
	subi $t1, $t1, 2
	j Loop

exit: li $v0, 4
	la $a0, endMessage
	syscall
	
	