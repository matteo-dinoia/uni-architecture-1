.globl _start
.data

.text
_start:
	addi s0 zero 60 # A
	addi  s1 zero 0 # B
	addi s2 zero 0 # result


	#chiamo funzione
	mv a0 s0
	mv a1 s1
	jal mcd
	
	jal print
	addi a0 zero 10
	jal print_line
	j exit

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