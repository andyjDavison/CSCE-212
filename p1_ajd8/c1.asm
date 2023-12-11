.data
greeting: .asciiz "Hello, may I have your name, please?\n"
ret: .asciiz "Welcome, "
newLine: .asciiz "\n"

.text
la $a0, greeting
li $v0, 4 # Print out greeting
syscall

li $v0, 8 # take in input

la $a0, newLine
li $a1, 20

move $t0, $a0
syscall

la $a0, ret
li $v0, 4
syscall

la $a0, newLine
move $a0, $t0
li $v0, 4
syscall