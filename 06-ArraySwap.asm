# Invert an array in memory using swap
.globl _start

.data
     size:   .word 16
     array:  .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15

.text
_start:
        la    s1, size
        lw    a1, 0(s1)  #get size
        la    a0, array  #get array
        
        jal   ra, print


       	lw    a1, 0(s1)  #get size
        la    a0, array  #get array
        
        jal   ra, invert


       	lw    a1, 0(s1)  #get size
        la    a0, array  #get array
        
        jal   ra, print

exit:
        li    a7, 10 #call number 10 = exit
        ecall

################################################################################
# Procedure swap(v, x, y)
# a0  -> address of v
# a1 -> index x
# a2 -> index y
# does not return anything
# swap is a leaf procedure that can be implemented with only temp registers
################################################################################
swap:
	slli a1 a1 2
	slli a2 a2 2
	
	add t3 a0 a1 #indirizzo x
	add t4 a0 a2 #indirizzo y
	
	#LOAD
	lw t1 0(t3)
	lw t2 0(t4)
	
	#CHARGE
	sw t2 0(t3)
	sw t1 0(t4)
	
	jalr ra

################################################################################
# Procedure invert(v)
# a0 -> v address
# a1 -> v size
################################################################################
invert:
	#SAVE
	addi sp sp -32
	sd ra 0(sp)
	sd a0 8(sp)

	#a0 start
	addi a2 a1 -1 #fine  index
	addi a1 zero 0  #ininzio index
	
	WHILE:
		bge a1 a2 END_WHILE
		
		#SAVE
		sd a1 16(sp)
		sd a2 24(sp)
		#CALL
		jal swap
		#LOAD
		ld a0 8(sp)
		ld a1 16(sp)
		ld a2 24(sp)
		
		addi a1 a1 1
		addi a2 a2 -1 #muovo contatori
		
		beq zero zero WHILE
	END_WHILE:
	
	#LOAD
	ld ra 0(sp)
	addi sp sp +32
	
	#exit
	jalr ra

################################################################################
# Procedure print(v)
# a0 -> v address
# a1 -> v size
################################################################################
print:
        addi  sp, sp, -32
        sd    s1, 0(sp)
        sd    a0, 8(sp)
        sd    a1, 16(sp)
        sd    ra, 24(sp)

        li    s1, 0
LOOP_print:
        beq   s1, a1, EXIT_print

        slli  t1, s1, 2
        add   t1, t1, a0
        lw    t0, 0(t1)

        addi  a0, t0, 0           # print a number
        li    a7, 1
        ecall

        addi  a0, zero, 0x20      # print space
        li    a7, 11
        ecall

        ld    a0, 8(sp)           # recover the value of a0
        ld    a1, 16(sp)          # recover the value of a1
        addi  s1, s1, 1           # move to the next word
        j     LOOP_print
EXIT_print:

        addi  a0, zero, 0x0A      # print new line
        li    a7, 11
        ecall

        ld    s1, 0(sp)
        ld    ra, 24(sp)
        addi  sp, sp, 32
        ret
################################################################################
