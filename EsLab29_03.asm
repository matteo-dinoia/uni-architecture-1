.globl _start
.data 


.text

_start:
	#setup
	addi t0 zero 11
	addi t1 zero 9
	addi t2 zero 10
	
	#code
	bge t0 t1 ELSE1
		mv t0 t1 
	ELSE1:
		mv t1 t0
	END_IF_ELSE1:
	
	
	bge t2 t1 ELSE2
		mv t2 t1
	ELSE2:
		mv t1 t2
	END_IF_ELSE2:
	
	
	#Stampo
	mv t3 t1
	add a0 zero t3
	jal print
	
	jal exit
print:
	addi x17 zero 1  # call number 1= print
	ecall
	
	jalr x0 0(ra)
exit:
	addi x17, x0, 10  # call number 10 = exit
	ecall