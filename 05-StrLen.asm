# strlen
.globl _start

.data
      src: .string "This is the source string."

.text
_start:

      # call strlen
      la   a0, src
      jal  ra, strlen

      # print the size, ret in a0
      li    a7, 1
      ecall
exit:
      #call number 10 = exit
      li    a7, 10
      ecall

################################################################################
# a0 = const char *str
################################################################################
strlen:
	addi t1 zero 0
	WHILE:
		lb t0 0(a0)
		
		
      	beq t0 zero END_WHILE #se uguale a end esco
		
		addi t1 t1 1
		addi a0 a0 1  # muovo counter di un byte
		beq zero zero WHILE  # torna su
	END_WHILE:
	
	mv a0 t1
	jr ra
      

################################################################################
