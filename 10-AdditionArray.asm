.globl _start
.data
	size:   .word 16
    array:  .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
.text




_start:
	#LOADDA
	la a0 array 
	
	la t0 size
	lw a1 0(t0)	#size
	
	#CHIAMA
	jal sumi
	jal print
	
	
	#RELOADDA
	la a0 array 
	
	addi a1 zero 0
	
	la t0 size
	lw a2 0(t0)	#size
	
	#CHIAMA
	jal sumr
	jal print
	
	j exit
	
sumi:
	addi t1 zero 0
	FOR:
		lw t0 0(a0)
		add t2 t2 t0
		#Counter
		addi t1 t1 1
		addi a0 a0 4
		
		blt t1 a1 FOR
	END_FOR:
	
	mv a0 t2
	jr ra

sumr:
	addi t0 zero 0 #RISULTATO DEFAULRT
	beq a1 a2 END_IF
		slli t2 a1 2
		add t1 a0 t2 #ottengo indirizzo
		lw s0 0(t1)  #loddo word
		addi sp sp -16 #SAVING
		sd s0 0(sp)
		sd ra 8(sp)
		
		addi a1 a1 1
		jal sumr
		
		
		
		ld s0 0(sp)
		ld ra 8(sp)
		addi sp sp 16
		
		add t0 s0 a0 #RISULTATO
	END_IF:
	
	mv a0 t0
	jr ra

print:
	addi a7 zero 1
	ecall
	jr ra
	
exit:
	addi a7 zero 10
	ecall