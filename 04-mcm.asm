.globl _start
.data

.text
_start:
	addi s0 zero 21 # A
	addi  s1 zero 14 # B
	addi s2 zero 0 # result


	#chiamo funzione
	mv a0 s0
	mv a1 s1
	jal mcm
	
	jal print
	addi a0 zero 10
	jal print_line
	j exit

mcm:
	mul t2 a0 a1
	
	#SAVE
	addi sp sp -16
	sd t2 0(sp)
	sd ra 8(sp)
	
	#METTO IN a0 valore di mcd
	jal mcd
	
	#RECOVER
	ld t2 0(sp)
	ld ra 8(sp)
	addi sp sp -16
	
	#CALCOLO
	div a0 t2 a0
	
	#EXIT
	jr ra

mcd:
	#controlli su a e b >0
	bge zero a0 END_ERROR
	bge zero a1 END_ERROR
	
	WHILE:
		beq a0 a1 END_WHILE #se diverso esco
		
		
		bge a1 a0 ELSE #se diverso vado a else
			sub a0 a0 a1  #  a0-=a1
			beq zero zero END_IF
		ELSE:
			sub a1 a1 a0    # a1-=a0
		END_IF:
		
		beq zero zero WHILE  # torna su
	END_WHILE:
	
	jr ra
	
	END_ERROR:
	addi a0 zero -1
	jr ra

print_line:
	addi a7 zero 11
	ecall
	jr ra
	
print:
	addi a7 zero 1
	ecall
	jr ra

exit:
	addi a7 zero 10
	ecall