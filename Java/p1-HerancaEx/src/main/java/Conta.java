/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Isabela Sakomura
 */
public abstract class Conta {
    protected String titular; 
    protected float saldo;
    
    public Conta(String titular,float saldo) {
        this.titular = titular;
        this.saldo = saldo; 
    }

    public String getTitular() {
        return titular;
    }

    public float getSaldo() {
        return saldo;
    }
    
    abstract float calcularRendimento(); // Precisa colocar a mesma assinatura: mesmos parametros, mesmo nome de funcao e mesmo retorno. 
}