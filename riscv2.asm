.globl _start
.data 

 
.text

_start:
	1
	
	add x28 x5 x6

exit:
	addi x17, x0, 10  # call number 10 = exit
	ecall
