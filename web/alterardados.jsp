<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String driver, url, usr, pwd, sql, idaluno;
            Connection connect;
            PreparedStatement select;
            ResultSet result;
            
            idaluno = request.getParameter("alt");
            
            driver = "com.mysql.cj.jdbc.Driver";
            Class.forName(driver);
            url = "jdbc:mysql://localhost:3306/atv_faculdade";
            usr = "root";
            pwd = "admin111";
            connect = DriverManager.getConnection(url, usr, pwd);
            
            sql = "SELECT * FROM alunos WHERE id = ?";
            select = connect.prepareStatement(sql);
            select.setString(1, idaluno);
            result = select.executeQuery();
        %>
        
        
        
        
    </body>
</html>
