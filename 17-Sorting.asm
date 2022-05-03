.globl _start
.data
	array: .word 1 0 1 3 5 6 -12 5 6
	length: .word 9
.text

_start:
	la a0 array
	la a1 length 
	lw a1 0(a1)
	jal selectionSort
	
	la a0 array
	la a1 length 
	lw a1 0(a1)
	jal printArray
	
	j exit

selectionSort:
	bne zero a1 END_IF7
		jr ra
	END_IF7:
	
	#SAVE
	addi sp sp -24
	sd s1 16(sp)
	sd s0 8(sp)
	sd ra 0(sp)
	
	mv s0 a0 
	mv s1 a1 
	
	jal minValueGetFirstIndex
	
	mv a2 a0
	addi a1 zero 0
	mv a0 s0
	jal swap
	
	addi a0 s0 +4
	addi a1 s1 -1
	jal selectionSort
	
	#LOAD
	ld s1 16(sp)
	ld s0 8(sp)
	ld ra 0(sp)
	addi sp sp +24
	
	jr ra

swap:
	slli t0 a1 2
	add t1 a0 t0  #lo mantengo  posizione s[a1]
	
	slli t0 a2 2
	add t2 a0 t0  #lo mantengo  posizione s[a2]
	
	lw t3 0(t1)
	lw t4 0(t2)
	
	sw t3 0(t2)
	sw t4 0(t1)
	
	
	jr ra

minValueGetFirstIndex:
	lw t0 0(a0) #minimo
	addi t2 zero 0 #minimo indice
	addi t1 zero 0  #counter
	
	WHILE6:
		lw t3 0(a0) #number 
		
		
		bge t3 t0 END_IF6
			mv t0 t3
			mv t2 t1
		END_IF6: 
		
		addi a0 a0 +4
		addi t1 t1 1
		blt t1 a1 WHILE6
	END_WHILE6:
	
	mv a0 t2
	jr ra

isSorted:
	addi t0 zero 1
	addi t1 zero 0
	
	WHILE5:
		lw t2 0(a0) #old number 
		addi a0 a0 +4
		lw t3 0(a0) #new number
		
		bge t3 t2 END_IF5
			addi t0 zero 0
			j END_WHILE5  #break
		END_IF5: 
		
		addi t1 t1 1
		blt t1 a1 WHILE5
	END_WHILE5:
	
	mv a0 t0
	jr ra
printArray:
	#SAVE
	addi sp sp -32
	sd s2 24(sp)
	sd s1 16(sp)
	sd s0 8(sp)
	sd ra 0(sp)
	
	mv s0 a0 
	mv s1 a1 
	addi s2 zero 0
	
	WHILE8:
		lw a0 0(s0)
		jal print
		
		addi s0 s0 +4
		addi s2 s2 +1
		blt s2 s1 WHILE8
	END_WHILE8:
	
	#LOAD
	sd s2 24(sp)
	ld s1 16(sp)
	ld s0 8(sp)
	ld ra 0(sp)
	addi sp sp +32
	
	jr ra
print:
	addi a7 zero 1
	ecall
	addi a7 zero 11
	addi a0 zero 10
	ecall
	jr ra
exit:
	addi a7 zero 10
	ecall