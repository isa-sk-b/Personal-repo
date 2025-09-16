		.data
		.align 0
msg_before_input: .asciz "Insert a number: "
msg_fact_1:       .asciz "The factorial of the number "
msg_fact_2:       .asciz " is "
newline:          .asciz "\n"
		.text 
		.align 2 # instructions in RISC-V have 32 bits 
		.globl main
main: 
		#print string 
		la a0,msg_before_input
		addi a7,zero,4 # 4: "print string terminated with null" from a0 
		la a0,msg_before_input
		ecall #print string in terminal
		la a0,newline 
		ecall #print new line
		#store int 
		#factorial and counter must be separate from each other 
		addi a7,zero,5 #1: "read int": store int in a0 
		ecall # int read 
		add s0,zero,a0 # store int in s0
		add t0,zero,s0 # creates factorial variable -> to be updated in function
		addi s1,zero,1 # used for comparison to end loop 
		addi t1,s0,-1 # store in counter register
loop_factorial: 
		mul t0,t0,t1 #use counter as multiplication factor
		addi t1,t1,-1
		bge t1,s1,loop_factorial
		j exit_loop
exit_loop: #there needs to be a label to delimit the end of the loop otherwise the rest of the code will be considered as loop_factorial
		addi a7,zero,4 # 4: "print string" from a0 
		la a0,msg_fact_1
		ecall #print "The factorial of the number" 
		addi a7,zero,1 # 1: "print int" from a0
		add a0,zero,s0 
		ecall #print numberinput 
		addi a7,zero,4 # 4: "print string" from a0 
		la a0,msg_fact_2
		ecall # print "is"
		addi a7,zero,1 # "print int" from a0 
		add a0,zero,t0 # store factorial result in a0 
		ecall #print the factorial result from a0 
		addi a7,zero,10 # 10: "exit program"
		ecall #exit 