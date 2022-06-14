.globl _start
.data
	array: .word -12 -11 43 54 65 65 77
	size: .word 7
.text
_start:
	la a0  array
	la a1  size
	lw a1 0(a1)
	
	jal is_sorted
	jal print
	
	j exit

is_sorted:
	add t0 zero zero
	lw t1 0(a0)
	WHILE:
		bge t0 a1 END_WHILE
		
		#old
		mv t2 t1
		
		#LEGOO E CONTROLLO DATO
		slli t1 t0 2
		add t1 a0 t1
		lw t1 0(t1)
		
		bge t1 t2 END_IF4
			addi a0 zero 0
			jr ra
		END_IF4:
		
		#aumento
		
		addi t0 t0 1
		
		beq zero zero WHILE
	END_WHILE:
	
	addi a0 zero 1
	jr ra

print:
	addi a7 zero 1
	ecall
	jr ra
	
exit:
	addi a7 zero 10
	ecall
