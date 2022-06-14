.globl _start
.data 
	str1: .string "muovi un disco da "
	str2: .string " a "
	str3: .string "\n"
.text

_start:
	li a0 1
	li a1 3
	li a2 2
	li a3 8
	
	jal move_tower
	j exit

move_tower:
	bne a3 zero eif
		jr ra
	eif:

	addi sp sp -16
	sd ra 0(sp)
	sb a0 8(sp)
	sb a1 10(sp)
	sb a2 12(sp)
	sb a3 14(sp)
	
	#chiamata 1
	lbu a0 8(sp)
	lbu a2 10(sp)
	lbu a1 12(sp)
	lbu a3 14(sp)
	addi a3 a3 -1
	jal move_tower
	
	#chiamata 2
	lbu a0 8(sp)
	lbu a1 10(sp)
	jal move_disk
	
	#chiamata 3
	lbu a2 8(sp)
	lbu a1 10(sp)
	lbu a0 12(sp)
	lbu a3 14(sp)
	addi a3 a3 -1
	jal move_tower
	
	#save
	ld ra 0(sp)
	addi sp sp +16
	
	jr ra
	
move_disk:
	mv a2 a0
	
	li a7 4
	la a0 str1
	ecall
	
	li a7 1
	mv a0 a2
	ecall
	
	li a7 4
	la a0 str2
	ecall
	
	li a7 1
	mv a0 a1
	ecall
	
	li a7 4
	la a0 str3
	ecall
	
	jr ra
	
exit:
	li a7 10
	ecall
	