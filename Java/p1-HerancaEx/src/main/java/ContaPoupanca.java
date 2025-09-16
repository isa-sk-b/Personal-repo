/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Isabela Sakomura
 */
public class ContaPoupanca extends Conta {
    private float taxaRendimentoMensal; 
    
    public ContaPoupanca(String titular, float saldo, float taxaRendimentoMensal) {
        super(titular,saldo);
        this.taxaRendimentoMensal = taxaRendimentoMensal; 
    }
    
    @Override 
    public float calcularRendimento() {
        return taxaRendimentoMensal*saldo; 
    }
}
