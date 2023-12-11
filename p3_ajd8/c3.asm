.data
processorA:	.asciiz "Processor A: "	
processorB:	.asciiz "Processor B: "
promptIC:	.asciiz "\nEnter instruction Count: "
promptCR:	.asciiz "Enter Clock Rate: "
promptCPI:	.asciiz "Enter CPI: "	
AisF:		.asciiz "\nA is "
BisF:		.asciiz "\nB is "
AisF1:		.asciiz " times as Fast as B"
BisF1:		.asciiz " times as Fast as A"

.text
.globl main
main:
		la $a0, processorA
		li $v0, 4
		syscall
		
		la $a0, promptIC
		li $v0, 4
		syscall
		
		li $v0, 6
		syscall
		mov.s	$f2,$f0
		
		la $a0, promptCPI
		li $v0, 4
		syscall
		
		li $v0, 6
		syscall
		mov.s	$f4,$f0
		
		la $a0, promptCR
		li $v0, 4
		syscall
		
		li $v0, 6
		syscall
		mov.s	$f6,$f0
		
		
		la $a0, processorB
		li $v0, 4
		syscall
		
		la $a0, promptIC
		li $v0, 4
		syscall
		
		li $v0, 6
		syscall
		mov.s	$f8,$f0
		
		la $a0, promptCPI
		li $v0, 4
		syscall
		
		li $v0, 6
		syscall
		mov.s	$f10,$f0
		
		la $a0, promptCR
		li $v0, 4
		syscall
		
		li $v0, 6
		syscall
		mov.s	$f14,$f0
		
		# finding out execution time for processor A
		mul.s	$f16,$f2,$f4
		div.s	$f16,$f16,$f6
		
		#finding out execution time for Processor B
		mul.s	$f18,$f8,$f10
		div.s	$f18,$f18,$f14
		
		#comparing both execution time which has lesser execution time will be faster 
		c.le.s	$f16,$f18
		bc1t 	AisFaster	# if A has lesser execution time then it is faster
		
		div.s	$f18,$f16,$f18		#finding out how much
		
		#print a string on consol
		la $a0, BisF
		li $v0, 4
		syscall
		
		#printing a floating point
		li $v0, 2
		mov.s $f12,$f18
		syscall
		
		#print a string on consol
		la $a0,BisF1
		li $v0, 4
		syscall
		
		#jump to exit
		j exit
		
		
AisFaster:
		
		#finding out how much faster	
		div.s $f16,$f18,$f16
		
		la $a0, AisF
		li $v0, 4
		syscall
		
		li $v0, 2
		mov.s $f12,$f16
		syscall
		
		la $a0, AisF1
		li $v0, 4
		syscall
		
exit:
		# exit code
		addi	$v0,$0,10
		syscall