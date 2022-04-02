.globl _start
.data 


.text

_start:
	#setup
	addi t0 zero 1
	slli t0 t0 63
	addi x17 zero 1  # call number 1= print
	
	
	
	WHILE:
		and t2 t0 x17
		add a0 a0 t2
		
		srli t0 t0 1
	bne zero t0 WHILE

	
	#Stampo
	#add a0 zero t3
	#jal print
	
	#jal exit
print:
	#addi x17 zero 1  # call number 1= print
	ecall
	
	#jalr x0 0(ra)
exit:
	addi x17, x0, 10  # call number 10 = exit
	ecall
