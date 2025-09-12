/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author isabe
 */
public class Main {

    public static void main(String[] args) {
        // TODO code application logic here
    Pessoa p1 = new Pessoa("Isabela",2008,"50019151802");
    Pessoa p2 = new Pessoa("Aecio",1972,"5059222050134");
    System.out.println(p1.exibirInformacoes());
    System.out.println(p2.exibirInformacoes()); 
    int Idadep1 = p1.calcularIdade(2025);
    int Idadep2 = p2.calcularIdade(2025); 
    boolean maiorIdadep1 = p1.maiorIdade(2025); 
    boolean maiorIdadep2 = p2.maiorIdade(2025);
    if(maiorIdadep1==true) System.out.println( "p1 é maior de idade");
    else System.out.println("p1 é menor de idade"); 
    if(maiorIdadep2==true) System.out.println( "p2 é maior de idade");
    else System.out.println("p2 é menor de idade");
    }    
}
