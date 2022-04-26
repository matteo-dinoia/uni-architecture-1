.globl _start
.data
	str1: 
		.string ""
	str2: 
		.string "second"
.text




_start:
	la a0 str1
	la a1 str2
	
	jal strcmp
	
	jal print
	
	j exit
	
strcmp:
	
	WHILE:
		lb t0 0(a0)
		lb t1 0(a1)  #loddo byte
		bne t0 t1 END_WHILE
		
		#COUNTER
		addi a0 a0 1
		addi a1 a1 1
		
		mul t2 t1 t0
		bne t2 zero WHILE  #salto se nessuna delle stringhe è finita
	END_WHILE:
	
	
	addi a0 zero 1
	bne t1 t0 END_IF
		addi a0 zero 0
	END_IF:
		
	jr ra
	
print:
	addi a7 zero 1
	ecall
	jr ra
	
exit:
	addi a7 zero 10
	ecall