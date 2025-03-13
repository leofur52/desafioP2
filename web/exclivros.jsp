<%@ page import="packclasses.Livro, packclasses.Erro, packclasses.ALDAL" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Livros</title>
        <style>
            /* Estilos gerais */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                color: #333;
                margin: 0;
                padding: 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            /* Contêiner principal */
            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                text-align: center;
            }

            /* Estilo de mensagens */
            .message {
                font-size: 1.1em;
                margin-top: 15px;
                padding: 10px;
                border-radius: 5px;
            }

            .success {
                color: #155724;
                background-color: #d4edda;
                border: 1px solid #c3e6cb;
            }

            .error {
                color: #721c24;
                background-color: #f8d7da;
                border: 1px solid #f5c6cb;
            }

            /* Título */
            h1 {
                font-size: 1.8em;
                color: #4e2470;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Excluir Livro</h1>
            <%
                String codigo = request.getParameter("codigo");

                if (request.getParameter("Deletar") != null) {
                    if (codigo == null) {
                        out.println("<div class='message error'>Erro: Código do livro não informado.</div>");
                    } else {
                        Livro livro = new Livro();
                        livro.setCodigo(codigo);

                        ALDAL.get(livro);

                        if (livro.getTitulo() == null) {
                            out.println("<div class='message error'>Erro: Livro com código " + codigo + " não encontrado.</div>");
                        } else {
                            Erro.setErro(false);
                            ALDAL.delete(livro);

                            if (Erro.getErro()) {
                                out.println("<div class='message error'>Erro ao excluir livro: " + Erro.getMens() + "</div>");
                            } else {
                                out.println("<div class='message success'>Livro excluído com sucesso.</div>");
                            }
                        }
                    }
                }
            %>
        </div>
    </body>
</html>
