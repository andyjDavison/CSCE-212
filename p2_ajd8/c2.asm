.data
	title: .asciiz "**BMI Calculator by Andy**\n"
	weight: .asciiz "Enter weight in pounds: "
	height: .asciiz "Enter height in feet: "
	inch2ft: .float 12.0
	num: .float 703.0
	under: .float 18.5
	over: .float 25.0
	indexUnder: .asciiz "\nBMI Index is Underweight\n"
	indexNorm: .asciiz "\nBMI Index is Normal\n"
	indexOver: .asciiz "\nBMI Index is Overweight\n"
.text
	li $v0, 4
	la $a0, title
	syscall
	
	main:
		l.s $f0, inch2ft
		l.s $f3, num
		#get the weight
		li $v0, 4
		la $a0, weight
		syscall
		li $v0, 6
		syscall
		mov.s $f1, $f0
		#get the height
		li $v0, 4
		la $a0, height
		syscall
		li $v0, 6
		syscall
		
		#calc bmi
		l.s $f2, inch2ft
		mul.s $f0, $f0, $f2 #multiply the feet to inches
		mul.s $f0, $f0, $f0 #inches sqrd
		div.s $f0, $f1, $f0 #divide weight by inches
		mul.s $f0, $f0, $f3 #multiply by 703
		
		li $v0, 2
		mov.s $f12, $f0
		syscall
		
		l.s $f1, under
		l.s $f2, over
		
		c.lt.s $f0, $f1
		bc1t underweight
		c.lt.s $f0, $f1
		bc1f else
	
	else:
		c.le.s $f0, $f2
		bc1t normalweight
		c.le.s $f0, $f2
		bc1f overweight
		
	underweight:
		la $a0, indexUnder
		j end
		
	normalweight:
		la $a0, indexNorm
		j end
	
	overweight:
		la $a0, indexOver
		j end
	
	end:
		li $v0, 4
		syscall
		j main
		
	
		
