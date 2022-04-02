.globl _start
.data 


.text

_start:
	li a0 13
	li a1 12
	
	#salvo
	addi sp sp -16
	sd a0 8(sp)
	sd a1 0(sp)
	
	la a0 visris
	jal print_label 
	
	ld a0 8(sp)
	jal area_triangolo
	#a0 non devo muoverla
	jal print
	jal print_line  #no need to save a0
	
	
	
	
	#PrintLabel
	la a0 visrisA
	jal print_label  #no need to save a0
	#print a
	ld a0 8(sp)
	jal print 
	jal print_line  #no need to save a0
	

	#printLabel
	la a0 visrisB
	jal print_label  #no need to save a0
	#print B
	ld a1 0(sp)
	addi sp sp +16
	mv a0 a1
	jal print 
	jal print_line  #no need to save a0
	
	
	jal exit

moltiplicazione:
	bge a1 zero END_IF #salta se a1 positivo
		sub a1 x0 a1
		sub a0 x0 a0  #inverto in caso uno negativo
	END_IF:
	
	add t0 zero zero
	FOR:
		bge zero a1 END_FOR
		
		#ris
		add t0 t0 a0
		
		#counter update
		addi a1 a1 -1
		
		beq zero zero FOR
	END_FOR:
	
	addi a0 t0 0
	jr ra
	
area_triangolo:
	#Save ra
	addi sp sp -8
	sd ra 0(sp)
	
	jal moltiplicazione
	srai a0 a0 1  #divido per due
	
	#recupero ra
	ld ra 0(sp)
	addi sp sp +8
	
	
	jr ra
	


print:
	addi a7 zero 1  # call number 1= print
	ecall
	
	jr ra
	
print_line:
	#stampa \r (carriage return)
	addi a0 zero 10
	addi a7, zero, 11  #print ascii
	ecall
	
	jr ra


print_label:	
	# stampa messaggio per il risultato
	addi a7, zero, 4
	ecall
	
	jr ra
	
exit:
	addi x17, x0, 10  # call number 10 = exit
	ecall

.data 
visris:      .ascii "The area of the triangle is "   
			.byte 0
		
visrisA:      .ascii "A: "  
				.byte 0
visrisB:      .ascii "B: "   
			.byte 0