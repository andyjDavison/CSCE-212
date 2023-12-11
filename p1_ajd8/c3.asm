.data
startMessage: .asciiz "Program starts\n"
endMessage: .asciiz "Program ends"
fout: .asciiz "f="
newLine: .asciiz "\n"

.text
li $v0, 4
la $a0, startMessage
syscall

addi $s0, $zero, 0
li $s1, 3
li $s2, 5
Loop: bgt $s0, 4, exit
	add $s3, $s0, $s1
	sub $s3, $s3, $s2
	
	# Print f=
	li $v0, 4
	la $a0, fout
	syscall
	
	# Print f
	li $v0, 1
	move $a0, $s3
	syscall
	
	# Print new Line
	li $v0, 4
	la $a0, newLine
	syscall
	
	addi $s0, $s0, 1
	j Loop

exit: li $v0, 4
	la $a0, endMessage
	syscall
