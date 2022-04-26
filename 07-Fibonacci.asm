.globl _start
.data
.text

_start:
	li s0 0
	li s1 50
	WHILE:
		
		mv a0 s0
		jal fibonacci 
		jal print
		
		addi s0 s0 1
	blt s0 s1 WHILE
	
	jal exit

#######################
#         a0 =n  -> 
# fibonacci calcona n-esimo termine
#################
fibonacci:
	#IF ==0
	beq a0 zero END
	
	#IF ==1
	addi t0 zero 1
	beq a0 t0 END
	
	
	#SAVE
	addi sp sp -24
	sd ra 0(sp)
	sd a0 8(sp)
	sd s0 16(sp)
	
	#CHIAMATE RICORSIVE
	addi a0 a0 -1  # fib(n-1)
	jal fibonacci
	
	mv s0 a0  #s0=ris
	ld a0 8(sp)
	
	addi a0 a0 -2# fib(n-2)
	jal fibonacci
	
	add s0 s0 a0 #s0 +=ris
	mv a0 s0   #sposto in return value
	
	#LOAD
	ld ra 0(sp)
	ld s0 16(sp)
	addi sp sp 24
	
	
	#EXIT
	END:
	jr ra

print:
	addi a7 zero 1
	ecall
	addi a7 zero 11
	addi a0 zero 32
	ecall
	jr ra
	
exit:
	addi a7 zero 10
	ecall
