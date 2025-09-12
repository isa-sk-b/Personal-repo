#ifndef EXERC7_C_INCLUDED
#define EXERC_7_INCLUDED
#define TRUE 1 
#define FALSE 0
#define DEBUGBASICO 0
#define DEBUGRAINHA 1
#define DEBUGROTACOES 0

//DEFINICOES DE ELEMENTOS
/*typedef struct elemento { // utilizado para armazenar a solucao na lista de solucoes
    int* solucao;
    NO* prox;
    NO* ant;
}NO;
typedef NO* Lista;*/

// FUNCOES DEBUGGING
void printarTabuleiro(int **tabuleiro, int N); 
void printarVetor(int *vetor,int N); 

// FUNCOES AUXILIARES 
void lerTerminal(int argc,char* argv[],int *flag_padrao,int *tamanho);
int** criarTabuleiro(int N);   //cria um tabuleiro com todos os valores iniciais iguais a 0
void liberarTabuleiro(int **tabuleiro, int N);
int* extrairSolucao(int** tabuleiro, int N);

// FUNCOES LISTA -> utilizar TAD LDED para inserir as soluções, uma vez que não sabemos a qtde delas
//void liberarLista(Lista *li);

// FUNCOES PROBLEMA
int podeInserir(int** tabuleiro,int N,int linha,int coluna);
int nRainhas(int **tabuleiro,int N,int *contagem, int linha);

#endif 