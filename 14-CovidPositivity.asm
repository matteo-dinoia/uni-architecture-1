.globl _start
.data

.text

_start:
	
	addi a0 zero 13  #000001101
	addi a1 zero 0
	jal has_near_positive
	jal print
	
	addi a0 zero 13  #000001101
	addi a1 zero 1
	jal has_near_positive
	jal print
	
	addi a0 zero 13  #000001101
	addi a1 zero 2
	jal has_near_positive
	jal print
	
	addi a0 zero 13  #000001101
	addi a1 zero 3
	jal has_near_positive
	jal print
	
	addi a0 zero 13  #000001101
	addi a1 zero 4
	jal has_near_positive
	jal print
	
	addi a0 zero 13  #000001101
	addi a1 zero 5
	jal has_near_positive
	jal print
	
	addi a0 zero 13  #000001101
	addi a1 zero 6
	jal has_near_positive
	jal print
	
	addi a0 zero 13  #000001101
	addi a1 zero 7
	jal has_near_positive
	jal print
	
	addi a0 zero 13  #000001101
	addi a1 zero 8
	jal has_near_positive
	jal print
	
	addi a0 zero 13  #000001101
	addi a1 zero 9
	jal has_near_positive
	jal print
	
	addi a0 zero 13  #000001101
	addi a1 zero 10
	jal has_near_positive
	jal print
	
	
	j exit

has_near_positive:

	addi t0 t0 5 # t0= ...000101
	sll t0 t0 a1
	srli t0 t0 1
	
	and t1 a0 t0
	slt a0 zero t1
	
	jr ra
	
print:
	addi a7 zero 1
	ecall
	jr ra

exit:
	addi a7 zero 10
	ecall