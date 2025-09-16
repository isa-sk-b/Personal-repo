/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.interfaceexercise;

/**
 *
 * @author Isabela Sakomura
 */
public class NotificacaoSMS implements Notificavel {
    private String numeroCelular; 

    public NotificacaoSMS(String numeroCelular) {
        this.numeroCelular = numeroCelular;
    }
    
    @Override
    public void enviarMensagem(String msg) {
        System.out.println("Enviando mensagem: " + msg + " \nPara numero de telefone: " + numeroCelular); 
    }
    
}
