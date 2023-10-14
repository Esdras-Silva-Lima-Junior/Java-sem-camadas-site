<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir dados</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300&display=swap" rel="stylesheet">
        <style>
            *{
                font-family: 'Roboto', sans-serif;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%
            String id, usr, pwd, url, drive, command;
            Connection connect;
            PreparedStatement delete;
            int result;
            
            id = request.getParameter("id");
            
            drive = "com.mysql.cj.jdbc.Driver";
            Class.forName(drive);
            url = "jdbc:mysql://localhost:3306/atv_faculdade";
            usr = "root";
            pwd = "admin111";
            connect = DriverManager.getConnection(url, usr, pwd);
            
            command = "DELETE FROM alunos WHERE id = ?";
            delete = connect.prepareStatement(command);
            delete.setString(1, id);
            result = delete.executeUpdate();
            
            if(result == 1){
                out.print("Dados apagado com sucesso!!");
            }else{
                out.print("Dados não foram apagados!!");
            }
            
        %>
    </body>
</html>
