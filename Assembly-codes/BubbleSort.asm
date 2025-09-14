# BubbleSort using dynamic string allocation 
		.data
		.align 2 
vector_int:	.word 10,9,8,7,4,2,45,65,1,13,13,5
size: 		.word 12 
		.align 0 
msg_before_order:	.asciz "\n Vector before ordering: \n" 
msg_after_order: 	.asciz "\n Vector after ordering: \n"
space:		.asciz " " 
		.text
		.align 2
		.globl main 
main: 
		# t3 saves the size of the vector 
		lw s0,size
		
		add t1,zero,zero # Initialize counter variable 
		
		# Print message and vector before sorting
		addi a7,zero,4 
		la a0,msg_before_order 
		ecall 			# Prints message 
		
		# Set address of label to t0 
		la t0,vector_int
		jal print_vector 		# prints vector	
		
		# Executes bubble sort 
		addi s1,s1,0 		#  in register to count the sorted region 
		la t0,vector_int 		# Fetches the address of the label (address of the first byte) to t0 
		addi t5,s0,-1 		# Saves the last index of the vector in other register 
		addi t6,t5,-1		# Counter to last index visited by bubbleSort_int
		add t1,zero,zero 		# Initialize t1 counter to roam through the vector 
		j bubbleSort_ext
return_main: 		
		# Print messsage and vector after sorting 
		la a0,msg_after_order 
		addi a7,zero,4 
		ecall 
		la t0,vector_int 
		jal print_vector 
		
		# Exit program 
		addi a7,zero,10 
		ecall


bubbleSort_int:	# Purpose: pass through the vector and switch places 
		lw t2,0(t0) 		# 0 bytes offset to address in t0 
		lw t3,4(t0) 		# 4 bytes offset to address in t0 
		# Store values in register so they can be compared 
		bgt t2,t3,switch_bubble 	# If t2 > t3, the vector is in descending order 
		j return_bubble
return_bubble:	
		addi t0,t0,4 		# Updates the address 
		addi t1,t1,1 		# Updates counter to pass through the vector 
		beq t6,t1,bubbleSort_ext_ret # If t1 reached the index of the 
		j bubbleSort_int 	


bubbleSort_ext:	# Purpose: Counts the area of vector that is already sorted 
		j bubbleSort_int 
bubbleSort_ext_ret: 
		addi t6,t6,-1		# The counter to bubbleSort_int is updated 
		addi t5,t5,-1  		# The counter is decreased until it reaches value in s1 
		beq t5,s1,return_main
		j bubbleSort_ext		# If t5 didn't reach s1 (passed through the vector all the times necessary), than repeat

switch_bubble: 
		sw t2,4(t0)		# t2 stored in the memory address of the next in the vector 
		sw t3,0(t0)		# t3 stored in the memory address of the current in the vector
		j return_bubble    


print_vector: 	
		lw t2,0(t0) 	# Prints word from 0 bytes offset of the address stored in register t0 
		addi t0,t0,4 	# update vector address
		addi t1,t1,1 	# update counter
		# Print number 
		add a0,zero,t2
		addi a7,zero,1 
		ecall 
		la a0,space 
		addi a7,zero,4 
		ecall
		bne t1,s0,print_vector 	# If wanted to print the commas, use a statement to exit the loop rather than return to its start. The statement 
					# Put the return loop unconditionally after executing the comparison code for exiting the loop.
		jr ra

