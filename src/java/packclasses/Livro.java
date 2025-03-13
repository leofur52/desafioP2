package packclasses;

public class Livro {
    private String codigo;
    private String titulo;
    private String autor;
    private String editora;
    private String ano;
    private String localizacao;
    
    // Métodos Getters
    public String getCodigo() {
        return codigo;
    }
    
    public String getTitulo() {
        return titulo;
    }
    
    public String getAutor() {
        return autor;
    }
    
    public String getEditora() {
        return editora;
    }
    
    public String getAno() {
        return ano;
    }
    
    public String getLocalizacao() {
        return localizacao;
    }
    
    // Métodos Setters
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    
    public void setAutor(String autor) {
        this.autor = autor;
    }
    
    public void setEditora(String editora) {
        this.editora = editora;
    }
    
    public void setAno(String ano) {
        this.ano = ano;
    }
    
    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }
}
