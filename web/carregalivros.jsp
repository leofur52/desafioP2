<%@page import="packclasses.Livro"%>
<%@page import="packclasses.Erro"%>
<%@page import="packclasses.ALDAL"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Alteração de livros</title>
        <link rel="stylesheet" href="CSS/cadastro.css">
    </head>
    <body>
        <%
            Livro livro = new Livro();
            String codigo = request.getParameter("codigo");

            if (codigo != null && !codigo.isEmpty()) {
                livro.setCodigo(codigo);
                ALDAL.get(livro);

                if (livro.getTitulo() == null) {
                    out.println("Livro com código " + codigo + " não encontrado.");
                    return;
                }
            } else {
                out.println("Código do livro não fornecido.");
                return;
            }
        %>  
        <!-- Formulário para edição dos dados -->
        <form method="post" action="alterar_livros.jsp">
            <p>
                <label for="codigo">Código:</label>
                <input type="text" name="codigo" id="codigo" value="<%= livro.getCodigo() %>" readonly>
            </p>
            <p>
                <label for="titulo">Título do livro:</label>
                <input type="text" name="titulo" id="titulo" size="70" value="<%= livro.getTitulo() %>">
            </p>  
            <p>
                <label for="autor">Autor:</label>
                <input type="text" name="autor" id="autor" value="<%= livro.getAutor() %>">
            </p> 
            <p>
                <label for="editora">Editora:</label>
                <input type="text" name="editora" id="editora" value="<%= livro.getEditora() %>">
            </p> 
            <p>
                <label for="ano">Ano:</label>
                <input type="text" name="ano" id="ano" value="<%= livro.getAno() %>">
            </p>      
            <p>
                <label for="localizacao">Local:</label>
                <input type="text" name="localizacao" id="localizacao" value="<%= livro.getLocalizacao() %>">
            </p> 
            <p>
                <input type="submit" name="Editar" value="Editar">   
            </p>
        </form>  
    </body>
</html>
