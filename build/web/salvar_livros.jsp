<%-- 
Arquivo JSP para manipulação de livros. Permite criar tabela e cadastrar livros no banco de dados.
--%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="packclasses.Livro, packclasses.Erro, packclasses.ALDAL" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Livro</title>
    </head>
    <body>
        <%
            if (request.getParameter("createTable") != null) {
                ALDAL.geraTabela(new Livro());
                out.println("Tabela criada com sucesso!");
            }

            String codigo = request.getParameter("codigo");
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            String editora = request.getParameter("editora");
            String ano = request.getParameter("ano");
            String localizacao = request.getParameter("localizacao");

            if (request.getParameter("Criar") != null) {
                if (codigo == null || titulo == null || autor == null 
                    || editora == null || ano == null || localizacao == null) {
                    out.println("<div style='color:red;'>Erro: Todos os campos devem ser preenchidos.</div>");
                } else {
                    Livro livro = new Livro();
                    livro.setCodigo(codigo);
                    livro.setTitulo(titulo);
                    livro.setAutor(autor);
                    livro.setEditora(editora);
                    livro.setAno(ano);
                    livro.setLocalizacao(localizacao);

                    Erro.setErro(false);

                    ALDAL.set(livro);
                    if (Erro.getErro()) {
                        out.println("<div style='color:red;'>Erro ao cadastrar livro: " + Erro.getMens() + "</div>");
                    } else {
                        out.println("<div style='color:green;'>Livro cadastrado com sucesso!</div>");
                    }
                }
            }
        %>   
    </body>
</html>
