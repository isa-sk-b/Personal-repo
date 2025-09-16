/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Isabela Sakomura
 */
public class NumeroComplexo {
    private double real;
    private double img; 
    
    public NumeroComplexo(double real,double img) {
        this.real = real;
        this.img = img;
    }
    
    @Override 
    public String toString() {
        if(img>=0) {
            return real + " + "  + img + "i";  
        } else {
            return real + " - " + (-img) + "i";         // O sinal precisa ser invertido, pois img printaria - (negativo), logo devemos converte-la para o seu modulo. 
        }
    }

    public double getReal() {
        return real;
    }

    public double getImg() {
        return img;
    }

    public void setReal(double real) {
        this.real = real;
    }

    public void setImg(double img) {
        this.img = img;
    }
    
    public NumeroComplexo adicionar(NumeroComplexo outro) {
        double real_resultante = this.real + outro.real; // O modificador private restringe o acesso a nível de classe, não de instância.
                                                        //Isso significa que qualquer método definido dentro da classe pode acessar os atributos private de 
                                                        // qualquer objeto dessa mesma classe, seja o this ou um outro objeto do mesmo tipo.
        double img_resultante = this.img + outro.img;
        NumeroComplexo nres = new NumeroComplexo(real_resultante,img_resultante);
        return nres; 
    }
    
    public NumeroComplexo multiplicar(NumeroComplexo outro) {
        double real_resultante = this.real*outro.real - this.img*outro.img; // Para acessar atributo ou metodo de uma instancia, colocar nome_instancia.atributo/metodo
        double img_resultante = this.real*outro.img + outro.real*this.img; 
        NumeroComplexo nres = new NumeroComplexo(real_resultante,img_resultante);  
        return nres; 
    }
}
