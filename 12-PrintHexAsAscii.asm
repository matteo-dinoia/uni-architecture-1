.globl _start
.data
	
.text




_start:
	li a0 -123
	jal printNum
	
	j exit
	
printNum:
	addi sp sp -8 #SAVE
	sd ra 0(sp)
	mv s0 a0
	
	jal printHexStart
	
	
	addi t3 zero 0 #counter
	FOR:
		addi t2 zero 15 #(ovvero ...00000000111)
		slli t2 t2 60  #(rendo  111000000000...)
		and a0 s0 t2  #maschera
		srli a0 a0 60  #(rendo  111000000000...)
		slli s0 s0 4 
		
		jal printDigit
		
		
		addi t3 t3 1 #add counter
		addi t2 zero 16 #numero max (per 64 bit)
		blt t3 t2 FOR
	END_FOR:	

	
	ld ra 0(sp) 
	addi sp sp 8
	
	jr ra
	
printDigit:
	addi sp sp -8
	sd ra 0(sp)
	
	addi a0 a0 48
	addi t0 zero 57
	bge t0 a0  END_IF3
		addi a0 a0 -48
		addi a0 a0 65
		addi a0 a0 -10
	END_IF3:
	jal printChar
	
	ld ra 0(sp)
	addi sp sp 8
	
	jr ra
printHexStart:
	addi sp sp -8
	sd ra 0(sp)
	
	addi a0 zero 48
	jal printChar
	
	addi a0 zero 120
	jal printChar
	
	ld ra 0(sp)
	addi sp sp 8
	
	jr ra
printChar:
	addi a7 zero 11
	ecall
	jr ra
	
exit:
	addi a7 zero 10
	ecall