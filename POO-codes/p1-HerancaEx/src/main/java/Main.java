/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */


/**
 *
 * @author Isabela Sakomura
 */
public class Main {
    
    public static void main(String[] args) {
        Conta[] contas = new Conta[2]; // Quando colocamos chaves, indica que estamos criando um vetor 
        //double[] rendimento = new float[2]; -> Caso quisessemos alocar string com tipo primitivo, utilizamos a mesma grafia 
        
        contas[0] = new ContaPoupanca("Isabela",1000,0.5f);
        contas[1] = new ContaInvestimento("Isabela-Sakomura",100000,800);
        
        for(Conta conta: contas) { // for(tipo_variavel nome_dada_variavel_nafunc : nome_vetor) -> percorre todos os elementos do vetor, sendo a cada um atribuido o nome conta
            float rendimento = conta.calcularRendimento(); 
            System.out.println("Titular: " + conta.getTitular());
            System.out.println("Rendimento RS: " + rendimento);
            System.out.println(); // imprime apenas a quebra de linha 
        }
    }
}
