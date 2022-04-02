.globl _start
.data
str: .ascii " è turno\n"
     .byte 0
.text

_start:
	li s4 2 #costante
	li s3 0 #counter
	li s0 0 #l'intero gioco
	WHILE:
		mv a0 s3
		jal print_turno
		jal prendi_numero
		addi t0 zero 9
		blt t0 a0 END_IF2
		bge zero a0 END_IF2
		#BASE DI QUANTO SPOSTARE ##########
		addi a0 a0 -1
		slli a0 a0 1    #a0=2 a0-1
		
		#TOLGO   ######################
		li t0 3
		sll t0 t0 a0 
		and t0 s0 t0
		bne t0 zero END_IF2
			#COSE SERIE  #######################
			rem a1 s3 s4
			add a0 a0 a1 #vedo se togliere o meno in base a chi gioca
		
			addi t0 zero 1   #t0=1
			sll t0 t0 a0   #t0=t0<<a0
			or s0 s0 t0      #s0=so or to
		
			mv a0 s0
			jal print_gioco 
			jal capo
		
			addi s3 s3 1 #COUNTER
		END_IF2:
	j WHILE


print_binary:
	addi a7 zero 35
	ecall
	jr ra
	
print_gioco:
	addi  t3 zero 7  #counter
	addi t4 zero 3   #costante
	
	#SALVO
	addi sp sp -16
	sd a0 0(sp)
	sd ra 8(sp)
	
	WHILE1:
		addi t4 zero 3   #costante
		bge zero t3 END_WHILE1
		
		addi t0 t3 -1 
		slli t0 t0 1  #t0=2(t0-1)
		sll t4 t4 t0  #t4=t4<<t0
		and t4 t4 a0  #t4=t4 and a0
		srl t6 t4 t0  #t4=t4>>t0
		
		addi t4 zero 3   #costante 2.0
		rem t5 t3 t4
		
		
		#CHIAMO PRINT
		addi a0 t6 0
		jal print
		jal space
		
		bne t5 zero END_IF1
			addi t3 t3 -6
			jal capo
		END_IF1:
		
		#ripristino
		ld a0 0(sp)
		
		addi t3 t3 +1 #COUNTER
		j WHILE1
	END_WHILE1:
	
	#ripristino e ritorno
	ld ra 8(sp)
	addi sp sp +16
	
	jr ra

print:
	addi a7 zero 1
	ecall
	jr ra
print_turno:
	
	addi a7 zero 1
	ecall
	
	#Stringa
	la a0 str
	addi a7 zero 4
	ecall
	
	jr ra
	
prendi_numero:
	addi a7 zero 5
	ecall
	jr ra

capo:
	addi a0 zero 10
	addi a7 zero 11
	ecall
	jr ra
	
space:
	addi a0 zero 32
	addi a7 zero 11
	ecall
	jr ra

exit:
	addi a7 zero 10
	ecall