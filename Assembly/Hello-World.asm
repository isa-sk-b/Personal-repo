		.data #definindo segmento de dados
		.align 2 #enderecos de memoria nas posicoes 2^2 bytes -> alinhamento para inteiros
vlr_inteiro: .word 174 # declara vlr_inteiro 174 na memoria (word)
		.align 0 
frase: .asciz "Hello World!" # declara frase como string terminada em 0 
		.text
		.globl main
main: 
		.align 2
		addi a7,x0,4 # 4: codigo de impressao de string 
				# a7: registrador em que sao guardados os codigos dos servicos executados pelo SO. (*)
		la a0,frase # instrucao para carregar o rotulo de uma memoria em um registrador 
		ecall
		addi a7,x0,10 # 10: codigo de saida do programa
		ecall
		
# EXPLICACOES SOBRE O CODIGO: 		
# (*) Note que "instrucao" e "servico" sao distintos: "instrucao e aquilo executado pelo processador, enquanto servico e
# toda operacao que e realizada pelo simulador ou sistema operacional, dado que o processador apenas consegue se comunicar 
# com os registradores e a memoria, e precisa do sistema operacional para se interagir com o mundo externo, como o console,
# os arquivos e o teclado, por exemplo.



