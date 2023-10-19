<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="updatestyle.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300&display=swap" rel="stylesheet">
</head>
<body>
    <%
        String driver, url, usr, pwd, sql, idaluno, nome, cpf, telefone, email, nome_curso;
        Connection connect;
        PreparedStatement update;
        Integer result;

        driver = "com.mysql.cj.jdbc.Driver";
        Class.forName(driver);

        url = "jdbc:mysql://localhost:3306/atv_faculdade";
        usr = "root";
        pwd = "admin111";
        connect = DriverManager.getConnection(url, usr, pwd);

        idaluno = request.getParameter("idaluno");
        nome = request.getParameter("nomeUpdate");
        cpf = request.getParameter("cpfUpdate");
        telefone = request.getParameter("telefoneUpdate");
        email = request.getParameter("emailUpdate");
        nome_curso = request.getParameter("namecurUpdate");

        sql = "UPDATE alunos SET nome = ?, cpf = ?, telefone = ?, email = ?, nome_curso = ? WHERE id = ?";
        update = connect.prepareStatement(sql);
        update.setString(1, nome);
        update.setString(2, cpf);
        update.setString(3, telefone);
        update.setString(4, email);
        update.setString(5, nome_curso);
        update.setString(6, idaluno);
        result = update.executeUpdate();

        if (result > 0) {
    %>
    <p>Atualização bem-sucedida!</p>
    <%
        } else {
    %>
    <p>Erro na atualização.</p>
    <%
        }
        update.close();
        connect.close();
    %>
</body>
</html>
