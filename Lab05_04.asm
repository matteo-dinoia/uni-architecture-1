.globl _start
.data
	length:    .word 9
	v:    .word  -3 32 3 54 564 43 4 2 -2 
.text

_start:
	la t0 v   #base address of our .data
	
	la t1 length  #length
	lw t1 0(t1)
	mv t2 zero  #counter
	add s0 zero zero #risultato
	add s1 zero zero #is full
	
	bge t2 t1 END_WHILE
	WHILE:
		lw t3 0(t0)
		beq s1 zero IF
		bge s0 t3 END_IF
			IF:
			addi s1 zero 1
			mv s0 t3
		END_IF:
		
		addi t0 t0 4
		addi t2 t2 1
		blt t2 t1 WHILE
	
	
	addi a0 s0 0
	jal print
	END_WHILE:
	
	j exit
	
print:
	addi a7 zero 1
	ecall
	jr ra
exit:
	addi a7 zero 10 
	ecall
