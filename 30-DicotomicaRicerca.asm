.globl _start
.data
	array: .word 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
	size: .word 16
.text

_start:
	la a0 array
	li a1 17
	la a2 size
	lw a2 0(a2)
	
	jal binsearch
	addi a7 zero 1
	ecall
	j exit

#bin search (array, researched, size
binsearch:
	li t1 0 #left
	li t2 0 #middle
	addi t3 a1 -1 #right
	
	while:
		blt t3 t1 ewhile
		
		#calcolo metà
		add t2 t1 t3
		srai t2 t2 1
		
		#ottengo valori in middle
		slli t5 t2 2
		add t5 a0 t5
		lw t5 0(t5)
		
		#condizioni
		bne t5 a1 elseif
			mv a0 t2
			jr ra
		elseif:
		bge t5 a1 else
			addi t1 t2 +1
			j end
		else:
			addi t2 t2 -1
		end:
		
		j while
	ewhile:
	
	li a0 -1
	jr ra

exit:
	addi a7 zero 10
	ecall