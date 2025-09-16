# Registradores usados na arquitetura RISC-V:
# a0 a a7: registradores de argumentos (quando chamamos a funcao, os primeiros 8 argumentos vao para a7); 
	# Entao os registradores de argumentos nao sao os unicos em que podem ser armazenados argumentos? E o que sao esses "argumentos", 
	# afinal?
# OBS1: ecall sempre usa a0 para retorno, ou seja, independentemente da opera��o realizada, o valor de retorno (se houver algum), ser�
# armazenado em a0, por padr�o.  
# OBS2: necessidade do registrador a0 - funcoes tem uma quantidade determinda de argumentos e forma que nao pode ser alterada, por isso a0 e
# usado para simplificar operacoes como inicializacao e comparacoes. 
# A maioria dos registradores sao de uso livre hoje em dia, apenas alguns sao de uso determinado como o sp e o rbp, que sao o stack pointer e o 
# basic pointer


# SIGNIFICADO DE TEMPORARIO: (registradores t):
# 


# Comandos basicos do Assembly
# Adicao
add  s0, s1, s2  # soma s1 e s2 e armazenar no registrador s0 
		# ADD s0,s1,s2 � referido como mnem�nico rd,rs1,rs2
		# ADD s0,s1,9 � referido mnem�nico rd,rs1,imm (9 � um valor imediato, que n�o precisa ser acessado pela mem�ria para 
		# obtermos o seu conte�do)
			# ADD imediato � aquele que possui algum operando como valor imediato (que n�o precisa ser acessado pela memoria)
		# Os mnemonicos sao os nomes das instrucoes, que apresentam um formato especifico. Logo, nao podemos somar 3 valores 
		# utilizando a instrucao como a acima add s0,s1,s2;
		# todos os registradores iniciados com "s" correspondem a registradores de dados a serem salvos;
# OBS: Nao existe subi. Para subtrair com valores imediatos, utilize addi com valor negativo. 

# Quantidade de registradores para salvar valores: s0 - s11 -> registradores para valores salvos
# Exemplos de codigo para o comando ADD
add s0,s1,s2   # x=y+z, caso x seja s0, y seja s1, e z seja s2 
addi s3,s4,8   # x=y+8, caso x seja s3 e y seja s4 
addi  s5,s5,1   # x=x+1 caso x seja s5


# Comparacao 
# Menor que
slt t0,t1,t2 # set less than: se t1 e menor do que t2, colocar t0 para 1, caso contrario, coloque t0 para 0; 
# Outros comandos: set less than imediate, set less than unsigned, set less than unsigned imediate
#  todos os numeros sao considerados sem o sinal quando ha unsigned 


# Instrucoes de salto
# desviam a execucao do programa para um endereco diferente da proxima instrucao 


# Comando ecall 
# Na arquitetura RISC-V, nao existem instrucoes nativas para ler do teclado ou escrever na tela. O processador s� 
# sabe manipular registradores e mem�ria. Para interagir com o "mundo externo" (teclado, console, arquivos), 
# ele precisa pedir ao sistema operacional ou aos simuladores (como o RARS) 
ecall # Environment call 
# O processador interrompe a execucao normal e passa o controle para o SO ou o simulador. 
# O que acontece depende do valor armazenado no registrador de servi�o (em muitos simuladores � o a7, mas pode ser 
# definido manualmente pelo programador) -> o registrador carrega o codigo de servico, que e o codigo que indica a 
# operacao a ser executada; 
# O registrador informa qual servi�o ser� lido: ler inteiro, imprimir inteiro, encerrar programa,...
# O registrador correto para armazenar qual tipo de instrucao seria lida e o a7 no RARS.

# Exemplos de uso do ecall:
addi t0, zero, 4   # codigo do servico: ler inteiro
ecall              # chama o servico do sistema
# apos o ecall, o inteiro lido fica em a0
addi t0, zero, 1   # codigo do servico: imprimir inteiro
ecall              # chama o servico
# o inteiro que ser� impresso j� deve estar em a0
