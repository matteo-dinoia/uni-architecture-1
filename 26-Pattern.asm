.globl _start
.data 
	src: .string "abababa"
	tofound: .string "ababa"
.text

_start:
	la a0 src
	la a1 tofound
	
	jal all_pos
	j exit

posinstr:
	addi t0 zero 0 #counter
	addi t3 zero 0 #counter secondo
	addi t6 zero -1 #where to restart AND result
	
	while:
		#read data
		add t1 a0 t0
		lbu t1 0(t1)
		
		add t2 a1 t3
		lbu t2 0(t2)
		
		#condizioni uscita
		bne t2 zero end_if3
			lbu a1 0(a1)
			bne zero a1 end
				addi t6 zero 0
			j end
		end_if3:
		
		bne t1 zero end_if4
			addi t6 zero -1
			j end
		end_if4:
		
		
		
		
		#controllo se uguali 
		beq t2 t1 end_if #se diversi
		blt t6 zero end_else #se rompe catena
			addi t0 t6 +1
			addi t3 zero 0
			addi t6 zero -1	
			j end_else
		end_if: #se uguali
			addi t3 t3 +1
			bge t6 zero end_else  # se primo uguali
				addi t6 t0 -1
		end_else:
		
		
		#counter add
		addi t0 t0 +1
		
		j while
	end:
	
	
	
	mv a0 t6
	jr ra




#-------------------------------------------------------------------------
all_pos:
	#SAVE
	addi sp sp -32
	sd ra 0(sp)
	sd a0 8(sp)
	sd a1 16(sp)
	
	
	#start
	addi t0 zero 0 #counter
	addi t3 zero 0 #counter secondo
	addi t6 zero -1 #where to restart AND result
	
	while2:
		#read data
		add t1 a0 t0
		lbu t1 0(t1)
		
		add t2 a1 t3
		lbu t2 0(t2)
		
		#condizioni uscita
		bne t2 zero end_if7
			lbu a1 0(a1)
			bne zero a1 end2
				addi t6 zero 0
			j end2
		end_if7:
		
		bne t1 zero end_if6
			addi t6 zero -1
			j end2
		end_if6:
		
		
		
		
		#controllo se uguali 
		beq t2 t1 end_if5 #se diversi
		blt t6 zero end_else5 #se rompe catena
			addi t0 t6 +1
			addi t3 zero 0
			addi t6 zero -1	
			j end_else5
		end_if5: #se uguali
			addi t3 t3 +1
			bge t6 zero end_else5  # se primo uguali
				mv t6 t0
		end_else5:
		
		
		#counter add
		addi t0 t0 +1
		
		j while2
	end2:
	
	
	
	
	
	blt t6 zero conclude
		#print
		sd t6 24(sp)
		mv a0 t6
		jal print 
		
		#restore
		ld a0 8(sp)
		ld a1 16(sp)
		ld t6 24(sp)
		
		#remade data
		addi t0 t6 +1
		addi t3 zero 0
		addi t6 zero -1 
		
		#restart 
		j while2
	conclude:
	
	
	
	ld ra 0(sp)
	addi sp sp +32
	jr ra
	
print:
	addi a7 zero 1
	ecall
	jr ra

exit:
	addi a7 zero 10
	ecall
