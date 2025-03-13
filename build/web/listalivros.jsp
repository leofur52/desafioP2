<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de livros</title>
        <link rel="stylesheet" href="CSS/tabela.css">
    </head>
    <body>
        <%
            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bancolivro", "root", "leofur52");
                st = conecta.prepareStatement("SELECT * FROM bancolivro.tablivro");
                ResultSet rs = st.executeQuery();
        %>
        <table>
            <tr>
                <th>Código</th><th>Título</th><th>Autor</th><th>Editora</th><th>Ano</th><th>localização</th>
            </tr>
        <%
            while (rs.next()) { 
        %>
            <tr>
                <td><%= rs.getString("codigo")%></td>
                <td><%= rs.getString("titulo")%></td>
                <td><%= rs.getString("autor")%></td>
                <td><%= rs.getString("editora")%></td>
                <td><%= rs.getString("ano")%></td>
                <td><%= rs.getString("localizacao")%></td>
            </tr>
        <%
        }
        %>
        </table>
        <%
            } catch (Exception e) {
                out.print("Erro:" + e.getMessage());
            }
        %>
    </body>
</html>
