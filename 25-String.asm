.globl _start
.data
	string: .string " "
	#string2: .string "lol2"
	#char1: .byte 'p'
	#char2: .byte 'z'
.text 

_start:
	la a0 string
	jal hashCode
	jal print
	
	
	j exit
	

#charAt(str. index)
charAt:
	
	addi t2 zero 0
	blt a1 zero END_WHILE  #controllo non negativo
	
	WHILE:
		#read
		lbu t0 0(a0)
		
		#condizioni uscita
		bne a1 zero END_IF
			mv t2 t0
			j END_WHILE
		END_IF:
		beq t0 zero END_WHILE
		
		#counter
		addi a1 a1 -1
		addi a0 a0 +1
		
		j WHILE
	END_WHILE:
	
	mv a0 t2
	jr ra
	

#substring(src, destination, start, end)
substring:
	blt a2 zero END_WHILE2 
	blt a3 a2  END_WHILE2 
	add a0 a0 a2   #punto partenza
	
	WHILE2:
		
		
		#condizioni uscita
		blt a3 a2  END_WHILE2
		
		#read
		lbu t0 0(a0)
		beq t0 zero END_WHILE2
		sb t0 0(a1)
		
		
		#counter
		addi a1 a1 +1
		addi a2 a2 +1
		addi a0 a0 +1
		
		j WHILE2
	END_WHILE2:
	
	sb zero 0(a1) #fine stringa
	
	jr ra

#endWith (str1, str2)
endWith:
	#salvo valori
	mv t0 a0
	mv t1 a1
	addi t6 zero 0   #result
	
	#trovo la fine delle 2 stringhe
	WHILE3:
		lbu t2 0(t0)
		lbu t3 0(t1)
		bne t2 zero END_IF3
			bne t3 zero END_IF4
				j END_WHILE3   #caso fattibile
			END_IF4:
			j END_WHILE4   #caso non fattibile
		END_IF3:
		
		addi t0 t0 +1
		beq t3 zero END_IF2
			addi t1 t1 +1
		END_IF2:
		
		j WHILE3
	END_WHILE3:
	
	
	WHILE4:
		#se arrivo a inizio seconda stringa
		bge t1 a1 END_IF5
			addi t6 zero 1
			j END_WHILE4
		END_IF5:
		
		lbu t2 0(t0)
		lbu t3 0(t1)
		bne t2 t3 END_WHILE4
		
		addi t0 t0 -1
		addi t1 t1 -1
		j WHILE4
	END_WHILE4:
	
	mv a0 t6
	jr ra

#replace(str, oldChar, newChar)
replace:
	
	WHILE6:
		#read
		lbu t0 0(a0)
		
		#condizioni uscita
		beq t0 zero END_WHILE6
		
		#replace
		bne t0 a1 END_IF6
			sb a2 0(a0)
		END_IF6:
		
		
		#counter
		addi a0 a0 +1
		
		j WHILE6
	END_WHILE6:
	
	jr ra

#trim(string)
trim:
	addi t6 zero 32
	addi a1 zero -1
	addi a2 zero -1
	addi t0 zero 0
	
	WHILE7:
		#read
		add t3 a0 t0
		lbu t1 0(t3)
		#condizioni uscita
		beq t1 zero END_WHILE7
		
		#inizio
		bge a1 zero END_IF10
		beq t6 t1 END_IF10
			mv a1 t0
		END_IF10:
		
		#fine
		beq t6 t2 END_IF11
		bne t6 t1 END_IF11
			mv a2 t0
		END_IF11:
		
		#counter e old
		addi t0 t0 +1
		mv t2 t1 #t2 è old
		
		j WHILE7
	END_WHILE7:
	
	
	addi a3 a2 -1
	mv a2 a1
	mv a1 a0
	
	#Save and call
	addi sp sp -8
	sd ra 0(sp)
	
	jal substring
	
	ld ra 0(sp)
	addi sp sp +8
	
	#end
	jr ra

#hashCode (string) ->hash
hashCode:
	li t6 5381 #ris
	WHILE8:
		#read
		lbu t1 0(a0)
		#condizioni uscita
		beq t1 zero END_WHILE8
		
		mv t0 t6
		slli t6 t6 5
		add t6 t6 t0
		add t6 t6 t1
		
		#counter e old
		addi a0 a0 +1
		
		j WHILE8
	END_WHILE8:
	
	mv a0 t6
	jr ra
	
prints:
	addi a7 zero 4
	ecall
	jr ra

printc:
	addi a7 zero 11
	ecall
	jr ra

print:
	addi a7 zero 1
	ecall
	jr ra

exit:
	addi a7 zero 10
	ecall