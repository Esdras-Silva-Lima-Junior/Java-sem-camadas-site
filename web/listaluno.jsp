<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%> <!-- Usado para fazer consulta no banco de dados -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista do aluno</title>
        <link rel="stylesheet" type="text/css" href="list.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300&display=swap" rel="stylesheet">
    </head>
    <body>
        
        <h1>LISTAGEM DOS SEUS DADOS E CADASTROS</h1>
        <%

            String driver, url, usr, pwd, sql;
            Connection connect;
            PreparedStatement executeSQL;
            ResultSet result;

            driver = "com.mysql.cj.jdbc.Driver";
            Class.forName(driver);

            url = "jdbc:mysql://localhost:3306/atv_faculdade";
            usr = "root";
            pwd = "admin111";
            connect = DriverManager.getConnection(url, usr, pwd);

            // Buscando os cursos que os alunos se cadastraram :
            sql = "SELECT * FROM alunos;";

            // Primeira Query :
            executeSQL = connect.prepareStatement(sql);
            // A variavel que guarda o resultado do select tem que ser do tipo ResultSet
            result = executeSQL.executeQuery();
           
        %>
        
        <div class="tabela">
            <table>
                <tr>
                    <th>ID CADASTRO</th>
                    <th>CPF</th>
                    <th>NOME</th>
                    <th>TELEFONE</th>
                    <th>E-MAIL</th>
                    <th>CURSO</th>
                    <th class="excluir"></th>
                </tr>
                
                
                
                
                
                <%
                    while (result.next()){
                %>
                    
                    <tr>
                        <td> <% out.print(result.getString("id")); %> </td>
                        <td> <% out.print(result.getString("cpf")); %> </td>
                        <td> <% out.print(result.getString("nome")); %> </td> 
                        <td> <% out.print(result.getString("telefone")); %> </td>
                        <td> <% out.print(result.getString("email")); %> </td>
                        <td> <% out.print(result.getString("nome_curso")); %> </td>
                        <td class="alterar">
                            <form method="post" action="alterardados.jsp">
                                  <input type="hidden" name="alt" value="<%= result.getString("id") %>">
                                  <input type="submit" value="Alterar">
                            </form>
                        </td>
                        <td class="excluir">
                            <form method="post" action="excdados.jsp">
                                  <input type="hidden" name="id" value="<%= result.getString("id") %>">
                                  <input type="submit" value="Excluir">
                            </form>
                        </td>
                    </tr>
                        

                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>
