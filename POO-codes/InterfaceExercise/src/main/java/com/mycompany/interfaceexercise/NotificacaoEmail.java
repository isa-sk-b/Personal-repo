/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.interfaceexercise;

/**
 *
 * @author Isabela Sakomura
 */
public class NotificacaoEmail implements Notificavel {
    private String email; 
    
    public NotificacaoEmail(String email) {
       this.email = email;
    }
    
    @Override
    public void enviarMensagem(String msg) {
        System.out.println("Enviando e-mail: " + msg + " \nPara destinatario: " + email);
    }
}
