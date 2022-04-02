.globl _start
.data 


.text

_start:
	addi t0 zero 2   #A
	addi t1 zero 2    #B
	addi a0 zero 0    #R
	
	bge t4 t0 ENDFOR2
	bge t5 t1 ENDFOR2
	FOR2:
		addi t5 zero 0
		FOR1:
			add a0 a0 a0
			add a0 a0 t4
			add a0 a0 t5
			
			addi t5 t5 1   #J
			blt t5 t1 FOR1
		ENDFOR1:
		
		addi t4 t4 1     #I
		blt t4 t0 FOR2
	ENDFOR2:
	
	#Stampo
	#add a0 zero t3
	#jal print
	
	#jal exit
print:
	addi x17 zero 1  # call number 1= print
	ecall
	
	#jalr x0 0(ra)
exit:
	addi x17, x0, 10  # call number 10 = exit
	ecall
