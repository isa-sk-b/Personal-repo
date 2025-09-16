/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Isabela Sakomura
 */
public class ContaInvestimento extends Conta{
    public float dividendosMensais; 
    
    public ContaInvestimento(String titular,float saldo,float dividendosMensais) {
        super(titular,saldo); 
        this.dividendosMensais = dividendosMensais; 
    }
    
     @Override
     public float calcularRendimento() {
         return saldo + dividendosMensais; 
     }
}
