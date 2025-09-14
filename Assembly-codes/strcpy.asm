		.data 
		.align 0
str_orig: 	.asciz "strcpy"
		.align 2
str_dest:	.word 		# pointer variable
		.text 
		.align 2 
		.globl main 
main: 		
		# Load str_orig's address in register a0
		la a0,str_orig
		jal strcpy 
		
		# Print string 
		lw a0,str_dest 	 
		addi a7,zero,4 	# service for ecall: prints bytes starting from address in a0 until finds \0 (string terminator)
		ecall 
		
		# Exit program
		addi a7,zero,10 
		ecall

strcpy: 
		add t0,zero,a0 	# load address of str_orig to register t0 
				# don't need other register because even if t0 is altered, we have a0 and even str_orig label 
		addi t1,zero,0  # counter
count_bytes_loop: 
		lb t3,0(t0)	
				# addresses are different from the bytes that are contents in strings, so we need to evaluate the byte ascii to determine 
				# whether the string reached its end or not. The instruction lb loads a byte from a given address. 
		addi t1,t1,1    # updates counter
		beq t3,zero,bytes_loop_exit # if encounters \0, exits loop
		addi t0,t0,1	# updates address
		j count_bytes_loop # returns to start of the loop 
bytes_loop_exit: 
		# Allocating the memory needed
		add t0,zero,a0 # t0 receives address of str_orig 
		add a0,zero,t1 # a0 receives number of bytes of string 
		addi a7,zero,9 	# 9: "allocates a0 bytes from heap memory"
		ecall 
		
		# Copying the bytes to str_dest until it reaches \0 
		add t2,zero,a0 	# loads the address of the allocated block to t2 
copying_bytes_loop: 
		lb t4,0(t0) 	# loads to t2 the byte in address 0 bytes offset from t0 
		sb t4,0(t2)
		addi t0,t0,1
		addi t2,t2,1
		bne t4,zero,copying_bytes_loop # returns to the start of the loop 
		
		# Updates label's first byte address to first byte address of the region in heap memory 
		la t3,str_dest 	# t3 used as buffer to modify str_dest 
		#int* t3 = str_dest
		sw a0,0(t3)
		#*t3 = a0			# equivalent to this piece of code, but doesn't exist in Assembly, so use not recommended "sw a0, str_dist, t3"
		jr ra
