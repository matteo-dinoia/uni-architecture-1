#Scrivere il codice di una funzione valoreassoluto con due parametri x, e y 
#che restituisce al chiamante il valore assoluto di x - y. 
#Il main avrà una sola variabile di nome "valore" in cui dovete memorizzare
# il valore restituito dalla funzione. La funzione deve essere chiamata sui valori 4 e 6.

.globl _start
.data
.text

_start:
	addi a0 zero 4
	addi a1 zero 6
	jal valoreassoluto
	jal print
	j exit
	
print:
	addi a7 zero 1
	ecall
	jr ra

exit:
	addi a7 zero 10
	ecall
	



#valoreassoluto(x, y)
valoreassoluto:
	sub a0 a0 a1
	
	bge a0 zero END_IF  #se positiva differenza fa nulla
		sub a0 zero a0
	END_IF:
	
	jr ra
