.data
greeting: .asciiz "Enter 4 positive integers each separated by the enter key:\n"

.text

li $v0, 4
la $a0, greeting
syscall

li $v0, 5
syscall
move $t0, $v0

li $v0, 5
syscall
move $t1, $v0

li $v0, 5
syscall
move $t3, $v0

li $v0, 5
syscall
move $t2, $v0

add $t0, $t0, $t1
add $t2, $t2, $t3
addi $t3, $t1, 3

sub $t0, $t0, $t2
add $t0, $t0, $t3

li $v0, 1
move $a0, $t0
syscall


