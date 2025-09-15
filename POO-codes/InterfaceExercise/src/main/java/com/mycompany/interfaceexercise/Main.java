/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package com.mycompany.interfaceexercise;

/**
 *
 * @author Isabela Sakomura
 */
public class Main {
    public static void main(String[] args) {
        NotificacaoEmail nemail = new NotificacaoEmail("isabelasakomura@gmail.com"); 
        NotificacaoSMS nSMS = new NotificacaoSMS("16997442005");
        CentralNotificacoes cnot = new CentralNotificacoes();
        
        cnot.NotificarAgora(nemail,"Vide a lista de compras do grupo B completa."); 
        cnot.NotificarAgora(nSMS,"Ola, estaria interessada em adquirir a nova oferta da Vivo?");
    }
    
}
