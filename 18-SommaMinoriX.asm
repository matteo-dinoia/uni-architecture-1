#Scrivere il codice di una funzione sommanat con parametro x che restituisce al 
#chiamante la somma dei numeri interi positivi minori o uguali a x ( ∑ � #
#$%& ). Il main avrà una sola variabile di nome somma in cui dovete memorizzare il valore 
#restituito dalla funzione. La funzione deve essere chiamata sul valore 10.
#Suggerimento: Nella funzione potete assumere che il valore del parametro x sia positivo
.globl _start
.data
	array: .word 1 2 3 -4 5 -6 7 8 9 10 11
	size:  .word 11
.text
_start:
	#CARICO VALORI
	la a0 array
	la t1 size
	lw a1 0(t1)
	
	#SCELGO X
	addi a2 zero 10
	
	jal sommanat
	jal print
	j exit


#SOMMANAT (array, size, x)
sommanat:
	add t6 zero zero #RIS
	add t1 zero zero
	WHILE:
		bge t1 a1 END_WHILE   #esco se più lungo lunghezza array
		
		#PREPARO INDIRIZZO E CARICO
		slli t0 t1 2  #in quanto word
		add t2 a0 t0
		lw t3 0(t2)
		
		#GUARDO se t3 (valore array[i]) <= a2 (x)
		blt t3 zero END_IF
		blt a2 t3 END_IF
			add t6 t6 t3
		END_IF:
		
		#AUMENTO CONTATORE
		addi t1 t1 1
		
		beq zero zero WHILE
	END_WHILE:
	
	
	mv a0 t6
	jr ra

print:
	addi a7 zero 1
	ecall
	
	jr ra

exit:
	addi a7 zero 10
	ecall 