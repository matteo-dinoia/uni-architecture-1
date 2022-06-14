.globl _start
.data 

.text

_start:
	li a0 6
	jal serief
	jal print
	j exit


serief:
	#CASO BASE
	li a1 4
	bge a0 a1 end_if
		li a0 1
		jr ra
	end_if:
	
	#SAVE
	addi sp sp -32
	sd ra 0(sp)
	sd s0 8(sp)
	sd s1 16(sp)
	sd s2 24(sp)
	
	#PREP
	addi s0 a0 -1
	addi s1 a0 -2
	addi s2 a0 -3
	
	#CHIAMAT£
	mv a0 s0
	jal serief
	mv s0 a0
	
	mv a0 s1
	jal serief
	mv s1 a0
	
	mv a0 s2
	jal serief
	mv s2 a0
	
	#SOMMA
	add a0 s0 s1
	add a0 a0 s2
	
	#RESTORE
	ld ra 0(sp)
	ld s0 8(sp)
	ld s1 16(sp)
	ld s2 24(sp)
	addi sp sp +32
	
	jr ra
	
print:
	addi a7 zero 1
	ecall
	jr ra

exit:
	addi a7 zero 10
	ecall
