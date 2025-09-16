/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.interfaceexercise;

/**
 *
 * @author Isabela Sakomura
 */
public class CentralNotificacoes {
    public CentralNotificacoes() {
    }
    public void NotificarAgora(Notificavel n,String msg) { // Interpretacao de objetos com interfaces:
                                                            // Quando eles transitam entre tipos, precisa fazer um casting (conversao de tipo) para 
                                                            // se assegurar que o tipo esta sendo interpretado como o tipo correto (adequado a utilizacao 
                                                            // que esta sendo dada para ele, com os metodos corretos chamados). 
                                                            // Precisa ser criada uma outra variavel que aponte para o mesmo objeto, e essa nova variavel vai
                                                            // interpretar o tipo como o tipo correto para a implementacao utilizada no trecho de codigo. 
        n.enviarMensagem(msg);
    }
}
