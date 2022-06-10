.globl _start

_start:
	addi a0 zero 14
	jal fattoriale
	jal print
	j exit
	
	
fattoriale:
	blt zero a0 END_IF
		addi a0 zero 1
		jalr ra
	END_IF:
	
	#STORE
	addi sp sp -16
	sd ra 0(sp)
	sd a0 8(sp)
	
	#CHIAMATA RICORSIVA
	addi a0 a0 -1
	jal fattoriale
	
	#OPERAZIONI
	ld a1 8(sp)
	mul a0 a1 a0
	
	#LOAD
	ld ra 0(sp)
	addi sp sp 16
	
	
	#return 
	jalr ra

print:
	addi a7 zero 1
	ecall
	jalr ra

exit:
	addi a7 zero 10
	ecall