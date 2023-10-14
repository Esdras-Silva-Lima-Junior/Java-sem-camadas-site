<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300&display=swap" rel="stylesheet">
    <title>Cadastro de aluno</title>
    <style>
        * {
            font-family: 'Roboto', sans-serif;
            color: black;
            padding: 10px;
            text-align: center;
            text-transform: uppercase;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <%
        // Variáveis
        String namecur, nameusr, email, tel, cpf;
        String url, usr, pwd;
        String SQL;
        Connection connect;
        PreparedStatement Insert;
        
        // Valores recebidos do HTML
        namecur = request.getParameter("nomecur");
        nameusr = request.getParameter("nome");
        email = request.getParameter("emailaluno");
        tel = request.getParameter("telaluno");
        cpf = request.getParameter("cpf_aluno");
        
        try {
            // Conexão com o banco de dados
            Class.forName("com.mysql.cj.jdbc.Driver");
            url = "jdbc:mysql://localhost:3306/atv_faculdade";
            usr = "root";
            pwd = "admin111";
            connect = DriverManager.getConnection(url, usr, pwd);
            
            // Inserção de dados na tabela "alunos"
            SQL = "INSERT INTO alunos (nome, telefone, email, cpf, nome_curso) VALUES(?,?,?,?,?)";
            Insert = connect.prepareStatement(SQL);
            Insert.setString(1, nameusr);
            Insert.setString(2, tel);
            Insert.setString(3, email);
            Insert.setString(4, cpf);
            Insert.setString(5, namecur);
            Insert.executeUpdate();
            
            out.print("Parabéns, você se cadastrou com sucesso!!");
        } catch (SQLException error) {
            if (error.getMessage().contains("Duplicate entry")) {
                out.println("Você já está cadastrado em um curso");
            } else {
                out.println("Erro no banco de dados: " + error.getMessage());
            }
        } catch (Exception noSQL) {
            out.println("Erro: " + noSQL.getMessage());
        }
    %>
</body>
</html>
