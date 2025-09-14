		.data
		.align 0 
str_opcoes:	.asciz "Boas vindas aventureiro! Insira a opção de serviço desejada: \n1.Adicionar item \n2.Remover item \n3.Listar inventário \n4.Buscar item \n5.Sair \n"
str_adicionado: 	.asciz "Item adicionado: Insira a nova opção desejada: \n1.Adicionar item \n2.Remover item \n3.Listar inventário \n4.Buscar item \n5.Sair "
str_removido:	.asciz "Item removido: Insira a nova opção desejada: \n1.Adicionar item \n2.Remover item \n3.Listar inventário \n4.Buscar item \n5.Sair "
str_listado:	.asciz "Inventário listado! Insira a nova opção desejada: \n1.Adicionar item \n2.Remover item \n3.Listar inventário \n4.Buscar item \n5.Sair "
str_buscado: 	.asciz "Item buscado! Insira a nova opção desejada: \n1.Adicionar item \n2.Remover item \n3.Listar inventário \n4.Buscar item \n5.Sair "
str_sair: 	.asciz "Executando saída do programa..."
str_buscado: 	.asciz "Item buscado! Insira a nova opção desejada: \n1.Adicionar item \n2.Remover item \n3.Listar inventário \n4.Buscar item \n5.Sair "
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
		
		# Salvando as possíveis opções do teclado:  
		addi s1,zero,1
		addi s2,zero,2
		addi s3,zero,3
		addi s4,zero,4
		addi s5,zero,5
		
loop_insercao:
		# Leitura da opção inserida pelo jogador: 
		addi a7,zero,5 
		ecall
				
		# Execução da opção inserida pelo usuário 
		beq a0,s1,add_item
		beq a0,s2,remover_item 
		beq a0,s3,listar_lista
		beq a0,s4,buscar_item
		beq a0,s5,sair  


add_item: 	# Adicionando itens da lista: 
		addi a7,zero,9  		# Ecall: alocar espaço na heap e colocar o endereço em a0
		
		j loop_insercao 

remover_item: 	
			
		j loop_insercao
listar_lista:
		
		j loop_insercao 

buscar_item: 
		
		j loop_insercao 

sair: 		
		# Printando mensagem de saída:  
		addi a7,zero,4
		la a0,str_sair
		ecall
		
		# Saindo do programa: 
		addi a7,zero,10 
		ecall 
		# como é uma arquitetura de 32 bits, o endereçamento é realizado em 4 bytes, por isso é necessário alocar 

		# Qual a diferença entre colocar um load word e um load address para uma label? 
		# O conte údo da label é um endereço, quando fazemos load word estamos carregando o endereço para o qual o label aponta. 
		# Quando fazemos load address, estamos carregando o endereço da label. Isso significa que podemos alterar o conteúdo da label 


