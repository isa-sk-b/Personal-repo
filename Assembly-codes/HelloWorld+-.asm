# Prints "Hello World--" if int is positive
# Prints "Hello World--" if int is negative
# Prints int at the end of the function
		.data
		.align 0 
str1: .asciz "Hello World++"
str2: .asciz "Hello World--"
newline: .asciz "\n"
		.text
		.globl main
main: 		
		.align 2 # instructions of 4 bytes or 32 bits: RISC-V architechture 
		addi a7,zero,5 # 5: "read int"
		# First, verify which of the strings must be loaded to a register. This prevents unecessary access and 
		# writing in the memory.
		ecall          #(<read int>):store in a0
		add s0,zero,a0
		addi a7,zero,4 # 4: "print string": stored in a0 
		blt s0,zero,print_negative  #if s0<0, jump to print_negative
		la a0,str1 #load str1 to a0
		ecall #prints string from a0 
		la a0,newline
		ecall
		j end
print_negative: la a0,str2  #everything after this label and before other label is print_negative, not just the print_negative line 
		# If I hadn't put "jump to end" and the "end" segment on the code, if the int was positive, the code wouldn't print anything
		# and wouldn't come to an end. 
		ecall #prints string from a0 
		la a0,newline 
		ecall
end:
		addi a7,zero,1 # "print int': stored in a0
		add a0,zero,s0
		ecall #prints int from a0 
		addi a7,zero,10 # end of code
		ecall
