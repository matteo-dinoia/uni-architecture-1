.globl _start
.data

.text

_start:
	
	addi a0 zero 6
	addi a1 zero 15
	jal somma_multipli_tre

	jal print
	j exit

somma_multipli_tre:

	addi t3 zero 3  #costante
	div t0 a0 t3
	
	
	rem t2 a0 t3
	bge zero t2 END_IF
		addi t0 t0 1
	END_IF:
	
	mul s0 t0 t3
	mv s1 a1
	addi s2 zero 0
	FOR:
		blt s1 s0 END_FOR
		
		add s2 s2 s0    #t1+=t0
		addi s0 s0 3     #t0+=3
		
		
		
		beq zero zero FOR
	END_FOR:
	
	mv a0 s2
	jr ra
	
print:
	addi a7 zero 1
	ecall
	jr ra

exit:
	addi a7 zero 10
	ecall