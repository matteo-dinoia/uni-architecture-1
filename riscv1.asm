#x5 ->x6 3-4 7-8??
#x17 x18??? maschere e poi risultato

#setto dati
li x5 0 
li x6 0xffffffffffffffff


#Or inizio
addi t3 x0 3
slli  t3 t3 3

and t3 t3 x5
slli t3 t3 4

or t2 x6 t3
#OR fine

#AND inizio
addi t4 x0 3
slli  t4 t4 7
not t4 t4
or t4 t4 t3

and t2 t2 t4
#AND fine





