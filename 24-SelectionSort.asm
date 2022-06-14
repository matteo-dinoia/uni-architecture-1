.globl _start
.data
	array: .word 3, 2, 2, 2,, 1 5, 7,
	size: .word 7
.text

_start:
	la a0 array
	la a1 size
	lw a1 0(a1)
	
	jal min_array
	
	jal print 
	j exit
	
min_array:
	add t0 zero zero
	lw t2 0(a0)   #t2 è min
	addi t3 zero 0   #t3 è  ID di min
	WHILE:
		bge t0 a1 END_WHILE
		
		
		#LEGOO E CONTROLLO DATO
		slli t1 t0 2
		add t1 a0 t1
		lw t1 0(t1)
		
		bge t1 t2 END_IF4
			mv t2 t1
			mv t3 t0
		END_IF4:
		
		#aumento
		
		addi t0 t0 1
		
		beq zero zero WHILE
	END_WHILE:
	
	mv a0 t3
	jr ra
print:
	addi a7 zero 1
	ecall
	jr ra
	
exit:
	addi a7 zero 10
	ecall