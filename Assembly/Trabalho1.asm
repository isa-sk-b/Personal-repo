		.data
		.align 0 
str_opcoes:	.asciz "Boas vindas aventureiro! Insira a op��o de servi�o desejada: \n1.Adicionar item \n2.Remover item \n3.Listar invent�rio \n4.Buscar item \n5.Sair \n"
str_adicionado: 	.asciz "Item adicionado: Insira a nova op��o desejada: \n1.Adicionar item \n2.Remover item \n3.Listar invent�rio \n4.Buscar item \n5.Sair "
str_removido:	.asciz "Item removido: Insira a nova op��o desejada: \n1.Adicionar item \n2.Remover item \n3.Listar invent�rio \n4.Buscar item \n5.Sair "
str_listado:	.asciz "Invent�rio listado! Insira a nova op��o desejada: \n1.Adicionar item \n2.Remover item \n3.Listar invent�rio \n4.Buscar item \n5.Sair "
str_buscado: 	.asciz "Item buscado! Insira a nova op��o desejada: \n1.Adicionar item \n2.Remover item \n3.Listar invent�rio \n4.Buscar item \n5.Sair "
str_sair: 	.asciz "Executando sa�da do programa..."
str_buscado: 	.asciz "Item buscado! Insira a nova op��o desejada: \n1.Adicionar item \n2.Remover item \n3.Listar invent�rio \n4.Buscar item \n5.Sair "
lista: 		.word 0 # Ponteiro para o inicio da lista 
		.align 2
		.text 
		.align 2
		.globl main 
main: 		
		# Imprimindo mensagem de boas-vindas do jogo: 
		addi a7,zero,4
		la a0,str_opcoes
		ecall
		
		# Salvando as poss�veis op��es do teclado:  
		addi s1,zero,1
		addi s2,zero,2
		addi s3,zero,3
		addi s4,zero,4
		addi s5,zero,5
		
loop_insercao:
		# Leitura da op��o inserida pelo jogador: 
		addi a7,zero,5 
		ecall
				
		# Execu��o da op��o inserida pelo usu�rio 
		beq a0,s1,add_item
		beq a0,s2,remover_item 
		beq a0,s3,listar_lista
		beq a0,s4,buscar_item
		beq a0,s5,sair  


add_item: 	# Adicionando itens da lista: 
		addi a7,zero,9  		# Ecall: alocar espa�o na heap e colocar o endere�o em a0
		
		j loop_insercao 

remover_item: 	
			
		j loop_insercao
listar_lista:
		
		j loop_insercao 

buscar_item: 
		
		j loop_insercao 

sair: 		
		# Printando mensagem de sa�da:  
		addi a7,zero,4
		la a0,str_sair
		ecall
		
		# Saindo do programa: 
		addi a7,zero,10 
		ecall 
		# como � uma arquitetura de 32 bits, o endere�amento � realizado em 4 bytes, por isso � necess�rio alocar 

		# Qual a diferen�a entre colocar um load word e um load address para uma label? 
		# O conte �do da label � um endere�o, quando fazemos load word estamos carregando o endere�o para o qual o label aponta. 
		# Quando fazemos load address, estamos carregando o endere�o da label. Isso significa que podemos alterar o conte�do da label 


