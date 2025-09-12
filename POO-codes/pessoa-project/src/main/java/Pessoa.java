/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author isabe
 */
public class Pessoa {
    private String nome; 
    private int ano_nascimento; 
    private String CPF; 
    
    // Construtor 
    public Pessoa (String nome,int ano_nascimento,String CPF) {
        this.nome = nome; 
        this.ano_nascimento = ano_nascimento;
        this.CPF = CPF; 
    }
    
    // Metodos get e set 
    public String getNome() { return this.nome; }
    public String getCPF() { return this.CPF; }
    public int getNascimento() { return this.ano_nascimento; }
    public void setNome (String novo_nome) { this.nome = novo_nome; }
    public void setCPF (String CPF) { this.CPF = CPF; }
    public void setNascimento (int ano_nascimento) { this.ano_nascimento = ano_nascimento; }
    public String exibirInformacoes() { return "Ano nascimento: " + ano_nascimento + " \nNome: " + nome + "\nCPF: " + CPF;}
    
    public int calcularIdade(int ano_atual) {
        int idade = ano_atual - ano_nascimento; 
        return idade;
    }
    
    public boolean maiorIdade(int ano_atual) {
        int idade = calcularIdade(ano_atual); 
        if(idade>=18) return true; 
        else return false;
    }
}
