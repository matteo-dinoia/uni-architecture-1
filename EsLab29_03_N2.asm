.globl _start
.data 


.text

_start:
	#setup
	addi t0 zero 8  #N
	addi t2 zero 0 #A 
	addi t3 zero 1  #B
	
	WHILE:
		add t3 t2 t3   #B=A+B
		sub t2 t3 t2   #A=B-A  (A+B)-A
		addi t0 t0 -1
	blt zero t0 WHILE

	
	#Stampo
	add a0 zero t3
	#jal print
	
	#jal exit
print:
	addi x17 zero 1  # call number 1= print
	ecall
	
	#jalr x0 0(ra)
exit:
	addi x17, x0, 10  # call number 10 = exit
	ecall
