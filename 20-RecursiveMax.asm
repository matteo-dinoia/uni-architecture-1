.globl _start
.data
	array: .word -2, -2, -2,   -6, -5 , -3,   -77, -4, -1
	size: .word  9
.text

_start:
	la a2 size
	lw a2 0(a2)
	addi a2 a2 0
	
	addi a1 zero 0
	
	la a0 array
	
	jal max
	jal print
	j exit


# max (array, 0, lenght-1)
max:
	#CONDIZIONE USCITA
	addi t3 a2 -1
	bne a1 t3 END_IF2
		slli a1 a1 2 #per word
		add a0 a0 a1 #per indirizzo
		lw a0 0(a0)  #v[i]
		jr ra
	END_IF2:
	
	#media
	add t0 a2 a1
	srai t0 t0 1    # media di inizio e fine troncata
	
	#SAVE
	addi sp sp -40
	sd t0 32(sp)
	sd a2 16(sp)
	sd a0 8(sp)
	sd ra 0(sp)
	
	
	#PRIMA CHIAMATA e save
	mv a2 t0
	jal max 
	sd a0 24(sp)
	
	#MID-restore
	ld a0 8(sp)
	ld a2 16(sp)
	lw t0 32(sp)
	
	#SECONDA CHIAMATA
	mv a1 t0
	jal max 
	
	#check
	ld t2 24(sp)
	bge a0 t2 END_IF
		mv a0 t2
	END_IF:
	
	
	#RESTORE
	ld ra 0(sp)
	addi sp sp +40
	
	jr ra 
	
	
print:
	addi a7 zero 1
	ecall

exit:
	addi a7 zero 10
	ecall 
