# strcat function - Assembly RISCV
		.data
		.align 0
str1:		.asciz  "Type first word: "
str2: 		.asciz 	"Type second word: "
		.text 
		.align 2
		.globl main 
main: 		
		# Print first message: 
		la a0,str1 
		addi a7,zero,4 
		ecall 
		
		# Count size of first string typed by user:
		la a0,str1 
		addi a7,,zero,8 # Reuse space: write 1st user string in space allocated to label in .data section 
		ecall 
		add a2,a0,zero 	
		add a1,zero,zero 
		jal read_size
		add s0,a1,zero	

		# Print second message: 
		

		# a2: first address of vector in memory (used to roam through the vector)
		# a1: counter to number of characters in string, used as 
read_size: 	




