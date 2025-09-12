#include "exerc7.h"
#include<string.h>
#include<stdio.h>
#include<stdlib.h>

int main(int argc, char* argv[]) {
    int tamanho,flag_padrao=FALSE;
    int contagem = 0;
    lerTerminal(argc,argv,&flag_padrao,&tamanho);
    if(flag_padrao==TRUE) {
        printf("Caso padrao iniciado!");
        return 0; 
    }
    int **tabuleiro = criarTabuleiro(tamanho);
    int *solucao = extrairSolucao(tabuleiro,tamanho); 
    printarTabuleiro(tabuleiro,tamanho);
    printarVetor(solucao,tamanho);
    
    /* Removido temporariamente para testar a extracao de solucoes 
    int encontrado = nRainhas(tabuleiro,tamanho,&contagem,0);
    if(contagem==0) printf("Nenhum resultado encontrado para as n rainhas.");
    else printf("Encontradas %d solucoes",contagem);*/


    liberarTabuleiro(tabuleiro,tamanho);
    return 0;
}