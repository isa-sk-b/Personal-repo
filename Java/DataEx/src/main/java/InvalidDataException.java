/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Exception.java to edit this template
 */

/**
 *
 * @author Isabela Sakomura
 */
package usp.br.excecoes;

import java.util.List;
import java.util.ArrayList;


public class InvalidDataException extends Exception {
    public InvalidDataException() {
    }
    public InvalidDataException(String msg) {
        super(msg);
    }
}
