.globl _start
.data
	stream: .word 1228 , 1024 , 2048 , 1536 , 5, 4096
	size: .word 6
	res: .word 8
	range_min : .word 1024
	range_max : .word 2048
.text

_start:
	li s0 0
	la s1 size
	lw s1 0(s1)
	
	for:
		bge s0 s1 efor
		
		#parametri
		la a0 stream
		slli t0 s0 2
		add a0 a0 t0
		lw a0 0(a0)
		
		la a1 res
		lw a1 0(a1)
		
		la a2 range_min
		lw a2 0(a2)
		
		la a3 range_max
		lw a3 0(a3)
		
		#chiamata
		jal convertitore
		
		#print
		li a7 35
		ecall
		li a7 11
		li a0 32
		ecall
		
		#counter
		addi s0 s0 +1
		j for
	efor:
	
	jal exit

#convertitore (dato, risoluzione, min, max)
convertitore:

	mv t1 a2 #left
	li t2 0 #middle
	mv t3 a3 #right
	li a5 0 #ris
	li t6 0
	
	while:
		bge t6 a1 ewhile
		
		
		#calcolo metà
		add t2 t1 t3
		srai t2 t2 1
		
		#shift
		slli a5 a5 1
			
		#in base 
		blt a0 t2 else
			addi a5 a5 1
			mv t1 t2
			j end
		else:
			mv t3 t2
		end:
		
		#comuni
		
		
		
		#counter
		addi t6 t6 +1
		
		j while
	ewhile:
	
	mv a0 a5
	jr ra

exit:
	li a7 10
	ecall