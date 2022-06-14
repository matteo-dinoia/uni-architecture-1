.globl _start
.data
	
.text

_start:
	li a0, 192 # Crea l’indirizzo 192.168.1.254 in a0
	li a1, 168
	li a2, 1
	li a3, 254
	jal ra, load_ipv4
	mv s0, a0 # Copia 192.168.1.254 in s0
	jal print
	
	li a0, 255 # Crea la maschera 255.255.0.0 in a0
	li a1, 255
	li a2, 0
	li a3, 0
	jal ra, load_ipv4
	mv s1, a0 # Copia 255.255.0.0 in s1
	jal print
	
	li a0, 192 # Crea l’indirizzo 192.168.1.254 in a0
	li a1, 168
	li a2, 10
	li a3, 23
	jal ra, load_ipv4
	mv s2, a0 # Copia 192.168.1.254 in s0
	jal print
	
	
	mv a0, s0 # 192.168.1.254 e’ parte di 192.168.*.*?
	mv a1, s1
	mv a2, s2
	
	jal is_in_subnet
	li a7 1
	ecall
	jal exit

load_ipv4:
	slli a0 a0 8
	add a0 a0 a1
	slli a0 a0 8
	add a0 a0 a2
	slli a0 a0 8
	add a0 a0 a3
	
	jr ra

is_in_subnet:
	and a0 a0 a1
	and a2 a2 a1
	
	xor a0 a2 a0
	
	beq zero a0 else
		li a0 0
		j eif
	else:
		li a0 1
	eif:
	jr ra
print:
	li a7 35
	ecall
	li a0 32
	li a7 11
	ecall
	jr ra
	
exit:
	li a7 10
	ecall