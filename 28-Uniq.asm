.globl _start
.data 
	string: .string "abracadabra"
	
.text

_start:
	la a0 string
	jal uniq
	
	la a0 string
	addi a7 zero 4
	ecall
	
	j exit

#removeChar (str, char, starting index)
removeChar:
	while:
		add t0 a0 a2
		lbu t0 0(t0)
		
		#condizione uscita
		beq zero t0 end
		
		#risoluzione
		bne t0 a1 else
			mv t2 a2
			whileInt:
				add t0 a0 t2
				addi t0 t0 +1
				lbu t0 0(t0)
				
				add t1 a0 t2
				sb t0 0(t1)
				
				#cond uscita
				beq zero t0 endInt
				
				#counter 
				addi t2 t2 +1
				j whileInt
			endInt:
			j end_else
		else:
			#counter
			addi a2 a2 +1
		end_else:
		
		
		j while
	end:
	
	jr ra

#uniq (string)
uniq:
	addi sp sp -16
	sd ra 0(sp)
	sd s0 8(sp)
	
	mv s0 a0
	
	while2:
		lbu a1 0(s0)
		
		#condizione uscita
		beq zero a1 end2
		
		#risoluzione
		mv a0 s0
		li a2 1
		jal removeChar
		
		#counter
		addi s0 s0 1
		j while2
	end2:
	
	ld s0 8(sp)
	ld ra 0(sp)
	addi sp sp +16
	jr ra
	
print:
	addi a7 zero 1
	ecall
	jr ra

exit:
	addi a7 zero 10
	ecall
