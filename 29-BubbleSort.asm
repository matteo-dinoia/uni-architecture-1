.globl _start
.data
	array: .word 1 4 -2 2 5
	size: .word 5
.text

_start:
	la a0 array
	la a1 size
	lw a1 0(a1)
	
	jal bubblesort
	j exit
#void bubsort(long*list,intsize){
#bool swapped;
#do{
# swapped=false;
# for(inti=1;i<size;i++){
#  if(list[i−1]>list[i]){
#   swapped=true;
#   long tmp=list[i−1];
#   list[i−1]=list[i];
#   list[i]=tmp;
#  }
# }
#}while(swapped);
bubblesort:
	
	do:
		#inizializzo swapped
		addi t0 zero 0 #swapped
		
		addi t1 zero 1
		for:
			bge t1 a1 efor
			
			#lettura dati
			slli a2 t1 2
			add a2 a2 a0
			
			slli a3 t1 2
			addi a3 a3 -4
			add a3 a3 a0
			
			lw t2 0(a2)
			lw t3 0(a3)
			
			bge t2 t3 eif
				addi t0 zero 1 #swapped true
				
				sw t3 0(a2)
				sw t2 0(a3)
			eif:
			
			addi t1 t1 +1
			j for
		efor:
		
		bne t0 zero do
	while:
	jr ra

exit:
	addi a7 zero 10
	ecall