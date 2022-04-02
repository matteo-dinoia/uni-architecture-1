.globl _start
.data 
	str_fat:      .ascii "The factorial of  "   
			.byte 0
		
	str_e:      .ascii " e': "  
				.byte 0

.text

_start:
	li a0 6
	addi sp sp -8  #inizio save
	sd a0 0(sp)
	
	#STAMPA "il fattoriale di &a0"
	la a0 str_fat
	jal print_label 

	ld a0 0(sp)
	jal print
	
	#STAMPA " e': "
	la a0 str_e
	jal print_label 
	
	
	#calcola fattoriale
	ld a0 0(sp)
	addi sp sp 8  #fine save
	jal fattoriale
	jal print
	
	
	jal exit

fattoriale:
	#CASO FINALE -> USCITA
	blt zero a0 END_IF # se STRETTTAMENTE POSITIVO
		addi a0 zero 1  #return 1
		jr ra
	END_IF:
	
	#SAVE
	addi sp sp -16  #inizio save
	sd a0 0(sp)
	sd ra 8(sp)
	
	#RICHIAMO SE E SALVO IN T0
	addi a0 a0 -1
	jal fattoriale
	mv t0 a0
	
	#RESTORE
	ld a0 0(sp)
	ld ra 8(sp)
	addi sp sp +16  #inizio save
	
	#RETURN 
	mul a0 a0 t0
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


