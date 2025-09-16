/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Isabela Sakomura
 */

package usp.br.excecoes;
import java.util.Scanner;


public class Data {
    private int dia; 
    private int mes;
    private int ano;

    public Data() {
        this.dia = 0;
        this.mes = 0;
        this.ano = 0;
    }
    
    private void setDia(int dia) throws InvalidDataException {
        if(dia<=0 || dia>31) {
            throw new InvalidDataException("Dia invalido!");    // Cria nova excecao e a lanca (deve ser pega na main) 
        } else {
            this.dia = dia; 
        }
    }
    
    private void setMes(int mes) throws InvalidDataException {
        if(mes<=0 || mes>12) {
            throw new InvalidDataException("Mes invalido!"); 
        } else {
         this.mes = mes;    
        }
    }
    
    public void setAno(int ano) throws InvalidDataException {
        if(ano>2025) {
            throw new InvalidDataException("Ano invalido!"); 
        } else {
            this.ano = ano; 
        }
    }
    
    @Override   
    public String toString() {
        return dia + "/" + mes + "/" + ano;
    }
    
    public void lerData()  {            // Utilizar o Scanner para ler uma data do teclado 
        Scanner sc = new Scanner(System.in);
        int n;
        while(true) {                   // Ler do teclado ate inserir dia valido 
            System.out.print("Dia: ");
             n = sc.nextInt(); 
            try {
                setDia(n);              // Caso tenha encontrado erro, vai direto para catch
                break;                  // Caso nao ocorra erro, para de coletar percorrer o loop (ja coletou uma data correta). 
            } catch (InvalidDataException error) {
                System.out.println(error.getMessage() + "\nDigite o dia novamente: ...");
            }
        }
        while(true) {
            System.out.print("Mes: ");
            n = sc.nextInt();
            try {
                setMes(n);
                break; 
            } catch (InvalidDataException error) {
                System.out.println(error.getMessage() + "\nDigite o mes novamente...");
            }
        }
        while(true) {
            System.out.print("Ano: ");
            n = sc.nextInt(); 
            try {
                setAno(n);          // Se deu certo setar o ano, nao pula para a parte do catch e executa o break 
                break;              // Se ocorreu a excecao na execucao do metodo, pula para a parte de catch 
            } catch (InvalidDataException error) { // Nao precisa criar um novo erro, porque o erro ja foi criado caso ocorra a condicao de excecao 
                System.out.println(error.getMessage() + "\nDigite o ano novamente...");
            }
        }
        sc.close();
        System.out.println("Data lida com sucesso!");
    }
}
