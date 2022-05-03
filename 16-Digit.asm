.globl _start
.data
	byteToCheck: .string "34563242"
	length: .word 8
.text

_start:
	la a0 byteToCheck
	jal isNumber
	beq a0 zero END_IF3
		la a0 byteToCheck
		la a1 length
		lw a1 0(a1)
		jal atoi #get number
		jal print
	END_IF3:
	
	j exit

atoi:
	bne a1 zero END_IF4
		addi a0 zero 0
		jr ra
	END_IF4:
	
	#save
	addi sp sp -24
	sd s1 16(sp)
	sd s0 8(sp)
	sd ra 0(sp)
	
	mv s0 a0
	add t0 s0 a1
	addi t0 t0 -1  #indirizzo s[n-1]
	lb s1 0(t0)
	addi s1 s1 -48   #s[n-1]-48
	
	mv a0 s0 
	addi a1 a1 -1
	jal atoi 
	
	addi t0 zero 10  
	mul a0 a0 t0    #moltiplico per 10
	add s1 s1 a0
	mv a0 s1   #10 ris+s1 =s1
	
	#LOAD
	ld s1 16(sp)
	ld s0 8(sp)
	ld ra 0(sp)
	addi sp sp +24
	
	jr ra

isNumber:
	#save
	addi sp sp -24
	sd s1 16(sp)
	sd s0 8(sp)
	sd ra 0(sp)
	
	mv s0 a0
	addi s1 zero 1
	
	WHILE:
		lb a0 0(s0)
		beq s1 zero END_WHILE
		beq a0 zero END_WHILE
		
		jal isDigit
		bne a0 zero END_IF2
			addi s1 zero 0
		END_IF2:
		
		addi s0 s0 1
		
		beq zero zero WHILE
	END_WHILE:
	
	
	mv a0 s1
	
	#LOAD
	ld s1 16(sp)
	ld s0 8(sp)
	ld ra 0(sp)
	addi sp sp +24
	jr ra

isDigit:
	addi t1 zero 0
	addi t0 zero 48 
	blt a0 t0 END_IF
	addi t0 zero 57 
	blt t0 a0 END_IF
		addi t1 zero 1
	END_IF:
	
	mv a0 t1
	
	jr ra

print:
	addi a7 zero 1
	ecall
	jr ra
exit:
	addi a7 zero 10
	ecall