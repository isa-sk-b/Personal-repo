# Implementing strcpy (without dinamic allocation of memory)
		.data 
		.align 0 
str_origin:       .asciz "Teste para simular funcao strcpy"
str_dest:         .space 33 
		.text
		.align 2 
		.globl main 
main: 
		la a0,str_origin # load string's first byte address to register a0 
		la a1,str_dest   # load destiny string's first byte address to register a1
		jal ra,strcpy_loop
		la t0,str_dest # stores the address of the copied string in register t0
		addi a7,zero,4 # print string operation 
		la a0,str_dest # if register a1 receive the address of str_dest, it means the code, that uses the address to store bytes, will save the whole string to the label address
		ecall 
		addi a7,zero,10 
		ecall # finishes the program execution 
		
		
strcpy_loop:	lb t0,0(a0) # load byte with 0 bytes offset from a0 address to register t0
		sb t0,0(a1) # store byte from register t0 to position (which is essentially an address) in register a1 (0 bytes offset)
		# t0 acts as buffer to transfer to str_origin to str_destiny 
		# a register can have more than one character inside it, but a whole string! 
		addi a0,a0,1 # a0 controls positions in first vector 
		addi a1,a1,1 # a1 controls positions in second vector 
		# memory is sequential, so the positions are next to each other (adding 1 to reach address from the next character of the string is correct) 
		bne t0,zero,strcpy_loop 
		jr ra # returns to line addres saved in ra, which is after the jal function call 
