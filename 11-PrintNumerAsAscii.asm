.globl _start
.data
	base: .word 10
.text




_start:
	li a0 -123
	jal printNum
	j exit
	
printNum:
	addi sp sp -16#SAVE
	sd ra 0(sp)
	sd s0 8(sp)
	mv s0 a0  #variable to not lose
	
	
	
	bge s0 zero END_IF
		jal printMinus
		addi t0 zero -1
		mul s0 s0 t0
	END_IF:
	
	addi a0 zero 0
	beq s0 zero END_IF2
	
		la t0 base #costant
		lw t0 0(t0)
		div a0 s0 t0  #ricorsivo
		jal printNum
		
		la t0 base #costant
		lw t0 0(t0)
		rem a0 s0 t0    #Stampo
		jal printDigit
		
		
	END_IF2:
	
	ld s0 8(sp)
	ld ra 0(sp) 
	addi sp sp 16
	
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
printMinus:
	addi sp sp -8
	sd ra 0(sp)
	
	addi a0 zero 45
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