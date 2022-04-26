
.globl _start
.data
	str: .string "my long string"
	char: .string "z"
.text




_start:
	la a0 str
	la a1 char
	
	jal strchar
	
	jal print
	
	j exit
	
strchar:
	lb t1 0(a1)  #loddo char
	addi a0 a0 -1 #anti counter
	WHILE:
		#COUNTER
		addi a0 a0 1
		lb t0 0(a0) #loddo byte string
		
		
		
		beq t0 zero END_WHILE #fine stringa
		bne t0 t1 WHILE  #non ancora trovato
	END_WHILE:
	
	
	
	bne t0 zero END_IF
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