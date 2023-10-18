<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String driver, url, usr, pwd, sql, idaluno_cad;
            Connection connect;
            PreparedStatement commandupdate;
            ResultSet result;

            idaluno_cad = request.getParameter("idaluno");
            
            driver = "com.mysql.cj.jdbc.Driver";
            Class.forName(driver);
            url = "jdbc:mysql://localhost:3306/atv_faculdade";
            usr = "root";
            pwd = "admin111";
            connect = DriverManager.getConnection(url, usr, pwd);

            sql = "UPDATE alunos SET nome = ?, cpf = ?, telefone = ?, email = ?, nome_curso = ? WHERE id = ?";
            commandupdate = connect.prepareStatement(sql);

            String nomeUpdate = request.getParameter("nomeUpdate");
            String cpfUpdate = request.getParameter("cpfUpdate");
            String telefoneUpdate = request.getParameter("telefoneUpdate");
            String emailUpdate = request.getParameter("emailUpdate");
            String nomecurUpdate = request.getParameter("namecurUpdate");

            commandupdate.setString(1, nomeUpdate);
            commandupdate.setString(2, cpfUpdate);
            commandupdate.setString(3, telefoneUpdate);
            commandupdate.setString(4, emailUpdate);
            commandupdate.setString(5, nomecurUpdate);
            commandupdate.setString(6, idaluno_cad);
            
        try {
            commandupdate.executeUpdate();
            out.print("Dados atualizados com sucesso!");
        } catch (SQLException e) {
            out.print("Erro ao atualizar dados: " + e.getMessage());
        }

        %>
    </body>
</html>
