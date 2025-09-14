# strcat function with assembly 
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
		
		

		# Print second message: 
		


read_size: 	
