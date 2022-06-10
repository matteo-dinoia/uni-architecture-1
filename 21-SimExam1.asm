.globl _start

.data
      str1: .string "123456"
      str2: .string "123456789"
.text
_start:
      # call longest_str
      la   a0, str1
      la   a1, str2
      jal  ra, longest_str
      jal print
      j exit
      

strlen:
	addi t2, zero, 0
	WHILE:
		lbu t1, 0(a0)
		beq t1, zero, END_WHILE
		
		addi t2, t2, +1
		addi a0, a0, +1
		beq zero, zero, WHILE
	END_WHILE:
	
	mv a0, t2
	jr ra

longest_str:
	#SAVE
	addi sp, sp, -24
	sd s0, 16(sp)
	sd ra, 8(sp)
	sd a1, 0(sp)
	
	#1 chiamata
	jal strlen
	
	#save e ricarica
	mv s0, a0 
	ld a0, 0(sp)
	
	jal strlen
	
	bge a0, s0, END_IF
		mv a0, s0
	END_IF:
	
	
	
	#RESTORE
	ld ra, 8(sp)
	ld s0, 16(sp)
	addi sp, sp, +24
	
	jr ra
	
print:
	addi a7, zero, 1
	ecall

exit:
	addi a7, zero, 10
	ecall