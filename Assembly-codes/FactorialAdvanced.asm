# Implementing factorial with recursion
	# Theory tidbits: 
	# difference of saved and temporary registers: 
	# the content of saved registers need to be mantained throughout the function 
	# stack: grows from the top to the bottom (the addresses are subtracted, not added)
		.data
		.align 0
str_beforefact:	.asciz "Insert a number: "
str_resultfact:   .asciz "\nThe factorial of the number is: "
		.text 
		.align 2 
		.globl main
main: 
loop: 
		# Print string before factorial: 
		addi a7,zero,4		#4: "print string" from a0 
		la a0,str_beforefact 
		ecall 
		
		# Read number inserted by user: 
		addi a7,zero,5             # 5: "read int" and store in a0
		ecall 
		
		jal factorial  # jal needs a register for address destination, if it's not informed, then register ra is used.     
		
		mul a1,a1,t1
		addi t1,t1,-1
		beq t1,zero,fim_loop
fim_loop: 	jr ra
		


	







