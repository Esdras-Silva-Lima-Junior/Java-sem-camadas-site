<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="pesquisastyle.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300&display=swap" rel="stylesheet">
        <title>Consulta</title> <!-- Corrigido para "Consulta" -->
    </head>
    <body>
        <%
            String driver, url, usr, pwd, sql, search;
            Connection connect;
            PreparedStatement command;
            ResultSet result;

            search = request.getParameter("nome");
            driver = "com.mysql.cj.jdbc.Driver";
            Class.forName(driver);

            url = "jdbc:mysql://localhost:3306/atv_faculdade";
            usr = "root";
            pwd = "admin111";
            connect = DriverManager.getConnection(url, usr, pwd);

            sql = "SELECT * FROM alunos WHERE nome LIKE ?";
            command = connect.prepareStatement(sql);
            command.setString(1, "%" + search + "%");
            result = command.executeQuery();
        %>

        <table>
            <tr>
                <th>ID CADASTRO</th>
                <th>CPF</th>
                <th>NOME</th>
                <th>TELEFONE</th>
                <th>E-MAIL</th>
                <th>CURSO</th>
            </tr>

            <%
                while (result.next()) {
            %>

            <tr>
                <td><% out.print(result.getString("id")); %></td>
                <td><% out.print(result.getString("cpf")); %></td>
                <td><% out.print(result.getString("nome")); %></td> 
                <td><% out.print(result.getString("telefone")); %></td>
                <td><% out.print(result.getString("email")); %></td>
                <td><% out.print(result.getString("nome_curso")); %></td>

            </tr>
            <%
                }

            %>

        </table>
    </body>
</html>
