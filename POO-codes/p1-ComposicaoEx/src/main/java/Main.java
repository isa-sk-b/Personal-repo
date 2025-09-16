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
        NumeroComplexo[] n = new NumeroComplexo[2]; // aloca strings de numero complexo na memoria 
         n[0] = new NumeroComplexo(5,3); 
         n[1] = new NumeroComplexo(10,2);
        
        NumeroComplexo nsoma = n[0].adicionar(n[1]); // O objeto ja foi criado, nova apenas recebe o espaco que esse objeto criado ja foi alocado 
        NumeroComplexo nmul = n[0].multiplicar(n[1]); 
        
        System.out.println("Soma:");
        System.out.println(nsoma.toString());
        System.out.println("Multiplicacao:");
        System.out.println(nmul.toString());
    }
    
}
