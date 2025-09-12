#include "exerc7.h"
#include<string.h>
#include<stdlib.h>
#include<stdio.h>

// FUNCOES PARA DEBUG 
void printarTabuleiro(int **tabuleiro, int N)
{
  int i,j; 
  for(i=0;i<N;i++) { // alternar as linhas
    for(j=0;j<N;j++) { // alternar as colunas
        printf("%d ",tabuleiro[i][j]);
    }
    printf("\n");
  }
  printf("\n");
  return; 
}

void printarVetor(int *vetor,int N) 
{
  printf("\n["); 
  for(int i=0;i<N-1;i++) {
      printf("%d, ",vetor[i]);
  }
  printf("%d]\n",vetor[N-1]);
  return;
}

// FUNCOES AUXILIARES
void lerTerminal(int argc,char* argv[],int *flag_padrao,int *tamanho) //1
{ 
  if(argc<2) 
  {
    *flag_padrao=TRUE; 
    return;
  }
  *tamanho = atoi(argv[1]); 
  return;
}

int** criarTabuleiro(int N)
{
  int **tabuleiro; 
  tabuleiro = (int**)calloc(N,sizeof(int*)); // aloca as linhas 
  // primeiro faz vetor de vetores (cada vetor correspondendo a uma linha)
  for(int i=0;i<N;i++) 
  { //aloca espaço para elementos em colunas distintas, em cada vetor de linhas
  // alocamos espaço em cada vetor, ou seja, para todos os seus N elementos da linha
    tabuleiro[i] = (int*)calloc(N,sizeof(int));
  }
  tabuleiro[1][3]=1;
  tabuleiro[2][1]=1; 
  tabuleiro[2][4]=1;
  tabuleiro[1][2] = -1;
  return tabuleiro;
}

void liberarTabuleiro(int **tabuleiro, int N) //2
{ 
  for(int i=0;i<N;i++) {
    free(tabuleiro[i]); //liberar os vetores 
  }
  free(tabuleiro);
  return; 
  }

int podeInserir(int** tabuleiro,int N,int linha,int coluna) //3 
{
  int flag_inserir=TRUE;
  int i,j,k;
  // verificando no tabuleiro se há rainhas na mesma diagonal, linha ou coluna 
  //para a linha 
  for(j=0;j<N;j++) {
    if(tabuleiro[linha][j]==1) {flag_inserir = FALSE; if(DEBUGBASICO) {printf("Nao pode inserir! Linha tomada\n");} break;}
  }
  // para a coluna
  for(i=0;i<N;i++) {
    if(tabuleiro[i][coluna]==1) {flag_inserir = FALSE; if(DEBUGBASICO) {printf("Nao pode inserir! Coluna tomada\n");} break;}
  }
  // para as diagonais
  j=coluna+1;
  k=coluna-1;
  for(i=linha+1;i<N;i++) {
    if(j<N) {if(tabuleiro[i][j]==1) {flag_inserir = FALSE; if(DEBUGBASICO) {printf("Nao pode inserir! Direcao (+1,+1)\n");} break;} j++;} // direcao (+1,+1)
    if(k>=0) {if(tabuleiro[i][k]==1) {flag_inserir = FALSE; if(DEBUGBASICO) {printf("Nao pode inserir! Direcao (+1,-1)\n");} break;} k--;} // direcao (+1,-1)
  } 
  j=coluna+1; 
  k=coluna-1;
  for(i=linha-1;i>=0;i--) {
    /*printf("i: %d ",i);*/
    /*printf("j: %d ",j);*/ if(j<N) {if(tabuleiro[i][j]==1) {flag_inserir = FALSE; if(DEBUGBASICO) {printf("Nao pode inserir! Direcao (-1,+1)\n");} break;} j++;} //direcao (-1,+1)
    /*printf("k: %d \n",k);*/ if(k>=0) {if(tabuleiro[i][k]==1) {flag_inserir = FALSE; if(DEBUGBASICO) {printf("Nao pode inserir! Direcao (-1,-1)\n");} break;} k--;} //direcao (-1,-1)
  }
  return flag_inserir;
}

int* extrairSolucao(int** tabuleiro, int N) 
{
  int* solucao = (int*)malloc(N*sizeof(int));
  int i,j;
  for(i=0;i<N;i++) {
    for(j=0;j<N;j++) {
      if(tabuleiro[i][j]==1) {solucao[j]=i; break;} // uso de malloc: caso nao haja nenhum elemento para a linha, mostra um numero aleatorio -> bom indicador para erro.
    }
  }
  return solucao;
};

// FUNCOES PARA LISTA
/*Lista criarLista(Lista li) 
{
  Lista li = (Lista)calloc(1,sizeof(NO));
  li->prox=NULL;
  li->ant=NULL; // porque essa implementacao precisaria do anterior?
}

void liberarLista(Lista *li) 
{
  
}

void adicionarElemento(NO elemento) 
{

}*/

// FUNCOES PRINCIPAIS
// https://n-queen-five.vercel.app/visualize -> Nrainhas considerando mesmo matrizes refletidas e rotacionadas
// https://oeis.org/A002562 ->Nrainhas desconsiderando reflexoes e rotacoes
int nRainhas(int **tabuleiro,int N,int *contagem, int linha) {
  int configuracao;
  if(linha==N)
    {
      *contagem = *contagem+1; 
      if(DEBUGRAINHA) printarTabuleiro(tabuleiro,N);
      return TRUE;//percorreu toda a matriz, encontrando uma solução para o problema. 
    }
  int j; 
    for(j=0;j<N;j++) 
    { //verificar se pode colocar rainha para todas as colunas
      int configuracao = podeInserir(tabuleiro,N,linha,j);
      if(configuracao==TRUE) 
      {
        tabuleiro[linha][j]=1;
        configuracao = nRainhas(tabuleiro,N,contagem,linha+1); // passar para a proxima linha
        tabuleiro[linha][j]=0;
      }
    }
    return configuracao;
}

/*Comentários adicionais sobre o código:
0. FUCAO CRIAR TABULEIRO
  - Opcional: caso queira definir elementos para verificar funcao de verificar se pode inserir
  -> testes abaixo sao para ordem 5
  tabuleiro[1][3]=1;
  tabuleiro[2][1]=1; 
  tabuleiro[2][4]=1;
  tabuleiro[1][2] = -1; // elemento que vamos verificar a insercao


1. FUNCAO LER TERMINAL
    - O vetor argv[i] aponta para a primeira posicao em argv na posicao i do vetor de vetores, portanto, quando sinalizamos 
      "*argv[i]", o endereco apontado é o primeiro do vetor de vetores
    - A funcao atoi recebe char * como argumento, contudo, e quando desejamos imprimir uma char no meio de um vetor e converte-la 
    para inteiro??
    - O int agrc corresponde aos indices dos vetores argv no vetor de vetores passado como argumento.
    A funcao atoi converte uma string inteira para inteiro, e nao apenas o primeiro caractere. Nesse caso, essa utilizacao 
    funciona, uma vez que queremos que valores superiores a 9 possam ser inseridos como ordem da matriz.
      Por exemplo, se temos char * string = "123" usando atoi(string), temos como resultado o int = 123. 
    Contudo, se quisermos converter um unico caractere dessa string para inteiro, é possível usar caractere - '0', que 
    converte um caractere de seu valor ASC para o digito correspondente (lembre-se que se for apenas um caractere,consegue 
    armazenar apenas DIGITOS)


2. FUNCAO LIBERAR TABULEIRO
    - Apenas seria necessário passar como ponteiro para tabuleiro (int***) caso quisessemos fazer alguma mudanca na 
    variavel tabuleiro, como alteracao do seu endereço, e passar essa mudança para o main. Nesse caso, o chamador 
    "tabuleiro" indicaria para uma variavel em um local diferente no sistema e com outras propriedades.
    Na aplicacao do exercicio isso nao faria sentido, mas caso "tabuleiro" fosse uma variavel de referencia e quisessemos
    altera-la para qual estrutura estava apontando, seria util. 
    - PRIMEIRO LIBERAR O VETOR DE LINHAS
    - DEPOIS LIBERAR AS LINHAS, QUE SAO VETORES DE NUMEROS
    Porque de fato sao dois ponteiros: um para o vetor de linhas (int**) e um correspondendo a cada linha (int*)]


3. FUNCAO VERIFICAR SE PODE INSERIR
    - CASO NAO QUEIRA FAZER A VERIFICACAO DUAS VEZES, SUBSTITUIR NO LOOP "break" POR "return flag_inserir"
    - CUIDADO, OS ENDERECOS ACESSADOS DEVEM ESTAR DENTRO DO INTERVALO ESPECIFICADO!
    - CUIDADO PARA NAO ACESSAR ENDERECOS QUE NAO EXISTEM! ISSO PODE OCORRER COM J E K, ENTAO E NECESSARIO FAZER UMA 
    VERIFICACAO SE ESTAO DENTRO DO INTERVALO 
    - Alem disso, j e k, como sao usados como indices para a variacao no eixo das colunas, entao deve ter como ponto inicial 
    a coluna que o elemento está situado, também. 
    - CUIDADO com a atualizacao de i,j e k, que precisam estar sincronizadas no loop, principalmente prestar atencao em relacao quando
    a posicao e visitada! 

    - Explicacao geometrica interessante: 
    As diagonais é como se fossem as retas identidades e identidade de sinal oposto para a origem como sao as diagonais 
    para aquele ponto, sao dois coeficientes angulares distintos mas quatro quadrantes para definir essa variacao, 
    sempre a variacao de x e y divididas tem -1 ou 1 como resultado dessa razao.


4. FUNCAO CONFIGURACOES NRAINHAS
    -Realizar backtracking
    -Funcao que encontra apenas uma das soluções das N rainhas:
      int nRainhas(int **tabuleiro,int N,int *contagem, int linha) {
        int configuracao;
        if(linha==N)
          {
            *contagem = *contagem+1; 
            if(DEBUGRAINHA) printarTabuleiro(tabuleiro,N);
            return TRUE; //percorreu toda a matriz, encontrando uma solução para o problema. 
          }
        int j; 
          for(j=0;j<N;j++) 
          { //verificar se pode colocar rainha para todas as colunas
            int configuracao = podeInserir(tabuleiro,N,linha,j);
            if(configuracao==TRUE) 
            {
              tabuleiro[linha][j]=1;
              configuracao = nRainhas(tabuleiro,N,contagem,linha+1); // passar para a proxima linha
              if(configuracao==TRUE) {
                //if(DEBUGRAINHA) printarTabuleiro(tabuleiro,N); 
                return configuracao;}; 
              tabuleiro[linha][j]=0;
            }
          }
          //if(DEBUGRAINHA) printarTabuleiro(tabuleiro,N);
          return FALSE;
        }

5. FUNCAO VERIFICACAO REFLEXOES E ROTACOES 
  -Tecnica de divisao e conquista: para comparacao das matrizes ->Dividir em matrizes circulares para verificar a simetria?? 
      Como se fosse um circulo expandindo e comparar as divisoes em subproblemas menores, se todos sao simetricos ou reflexoes quer dizer que é 
      uma reflexao, se algum nao é já podemos parar a verificacao;
      - Verificar apenas as bordas das matrizes

*/