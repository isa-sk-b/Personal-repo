		.data 
		.align 2
int_vector:     .word 7,5,2,1,1,3,4,-1 #undefined vector size, use sentinel as terminating variable
		.align 0 
print_vector    .asciz "Vector before sorting"
print_vector_sorted:   .asciz "Sorted int vector: "
newline:        .asciz "\n"
		.text 
		.align 2 
		.globl main
main: 
loop_read_vector: 
		bge int_vector(),zero,loop_read_vector #how to change the alignment value????
loop_bubble_sort: #does it need to put two different loops? what is the priority between them? 
loop_print_vector: 
end: 
		addi a7,zero,10 #10: "exit code" 
		ecall #exit
		





