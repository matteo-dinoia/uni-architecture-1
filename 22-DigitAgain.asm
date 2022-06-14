.globl _start
.data
	string: .string ""
.text
_start:
	la a0  string
	jal is_number
	beq a0 zero END_IF3
		la a0  string
		jal atoi
		mul a0 a0 a0
		jal print
	END_IF3:
	
	j exit

atoi:
	add t2 zero zero
	addi t3 zero 10    #t3 costante
	WHILE:
		#LEGOO E CONTROLLO DATO
		lbu t0 0(a0)
		beq t0 zero END_WHILE
		
		#aggiungo nuova cifra
		addi t0 t0 -48
		mul t2 t2 t3
		add t2 t2 t0
		
		#aumento
		addi a0 a0 1
		
		beq zero zero WHILE
	END_WHILE:
	
	mv a0 t2
	jr ra

is_number:
	#SAVE
	addi sp sp -16
	sd ra 0(sp)
	sd s0 8(sp)
	
	mv s0 a0
	
	#PRENDO VALORE
	lbu a0 0(s0)
	bne a0 zero END_IF2
		addi a0 zero 1
		beq zero zero END
	END_IF2:
	
	#CHIAMATA
	jal digit
	beq a0 zero END
		addi a0 s0 1
		jal is_number
	END:
	
	#LOAD
	ld s0 8(sp)
	ld ra 0(sp)
	addi sp sp +16
	jr ra

digit: 
	addi t0 zero 0
	
	addi t1 zero 48
	addi t2 zero 57
	blt a0 t1 END_IF
	blt t2 a0 END_IF
		addi t0 zero 1
	END_IF:
	
	mv a0 t0 
	jr ra

print:
	addi a7 zero 1
	ecall
	jr ra
	
exit:
	addi a7 zero 10
	ecall
