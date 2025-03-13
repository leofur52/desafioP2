<%@page import="packclasses.Livro"%>
<%@page import="packclasses.Erro"%>
<%@page import="packclasses.ALDAL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de produtos</title>
        <link rel="stylesheet" href="CSS/tabela.css">
    </head>
    <body>
        <%
            String codigo = request.getParameter("codigo");

            if (request.getParameter("Consultar") != null) {
                if (codigo == null || codigo.trim().isEmpty()) {
                    out.println("<div class='error'>Faltando código do livro.</div>");
                    return;
                }

                Livro livro = new Livro();
                livro.setCodigo(codigo);

                Erro.setErro(false);
                ALDAL.get(livro);

                if (Erro.getErro()) {
                    out.println("<div class='error'>Erro ao buscar o livro: " + Erro.getMens() + "</div>");
                } else if (livro.getTitulo() == null) {
                    out.println("<div class='error'>Livro não encontrado com o código " + codigo + ".</div>");
                } else {
        %>
        <table>
            <tr>
                <th>Código</th><th>Título</th><th>Autor</th><th>Editora</th><th>Ano</th><th>Localização</th>
            </tr>
            <tr>
                <td><%= livro.getCodigo() %></td>
                <td><%= livro.getTitulo() %></td>
                <td><%= livro.getAutor() %></td>
                <td><%= livro.getEditora() %></td>
                <td><%= livro.getAno() %></td>
                <td><%= livro.getLocalizacao() %></td>
            </tr>
        </table>
        <%
                }
            }
        %>
    </body>
</html>
