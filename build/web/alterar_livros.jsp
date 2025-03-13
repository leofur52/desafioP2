<%@page import="packclasses.Livro"%>
<%@page import="packclasses.Erro"%>
<%@page import="packclasses.ALDAL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Alteração de livros</title>
    </head>
    <body>
        <%
            String codigo = request.getParameter("codigo");
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            String editora = request.getParameter("editora");
            String ano = request.getParameter("ano");
            String localizacao = request.getParameter("localizacao");

            if (request.getParameter("Editar") != null) {
                if (codigo == null || titulo == null || autor == null 
                    || editora == null || ano == null || localizacao == null) {
                    out.println("<p>Faltando parâmetros obrigatórios.</p>");
                    return;
                }

                Livro livroChave = new Livro();
                livroChave.setCodigo(codigo);

                Livro livroDados = new Livro();
                livroDados.setCodigo(codigo); 
                livroDados.setTitulo(titulo);
                livroDados.setAutor(autor);
                livroDados.setEditora(editora);
                livroDados.setAno(ano);
                livroDados.setLocalizacao(localizacao);

                Erro.setErro(false);
                ALDAL.update(livroDados, livroChave);

                if (Erro.getErro()) {
                    out.println("<p>Erro ao atualizar o livro: " + Erro.getMens() + "</p>");
                    return;
                }
                out.println("<p>O livro foi editado com sucesso.</p>");
            }
        %>    
    </body>
</html>
