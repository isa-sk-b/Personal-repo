# BubbleSort using dynamic string allocation 
		.data
		.align 2 
vector_int:	.word 7,5,2,1,1,3,4
size: 		.word 7 
		.align 0 
msg_before_order:	.asciz "\n Vector before ordering: \n" 
msg_after_order: 	.asciz "\n Vector after ordering: \n"
space:		.asciz " " 
		.text
		.align 2
		.globl main 
main: 
		# t3 saves the size of the vector 
		lw t3,size
		
		# Initialize counter variable 
		add t1,zero,zero 
		
		# Print message and vector 
		addi a7,zero,4 
		la a0,msg_before_order 
		ecall # prints message 
		
		# Set address of label to t0 
		la t0,vector_int
		jal print_vector # prints vector	
		
		# Exit program 
		addi a7,zero,10 
		ecall

print_vector: 	
		lw t2,0(t0) 	# prints word from 0 bytes offset of the address stored in register t0 
		addi t0,t0,4 	# update vector address
		addi t1,t1,1 	# update counter
		# print number 
		add a0,zero,t2
		addi a7,zero,1 
		ecall 
		bne t1,t3,print_vector
		jr ra
