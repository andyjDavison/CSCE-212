.data
	greeting: .asciiz "Enter two positive floating point numbers separated by the enter key:\n"
	zero: .float 0.0
	one: .float 1.0
	
.text
	la $a0, greeting
	li $v0, 4
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	li $v0, 6
	syscall
	
	add.s $f3, $f0, $f4
	
	l.s $f2, one
	l.s $f5, one
	l.s $f4, zero
	j loop
	
	loop: c.lt.s $f2, $f1
		bc1f end
		add.s $f3, $f3, $f0
		add.s $f2, $f2, $f5
		j loop
		
	end:
		mov.s $f12, $f3
		li $v0, 2
		syscall
		li $v0, 10
		syscall
