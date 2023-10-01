<%@page import="Movies.dao.FilmesDao"%>
<%@page import="Movies.model.Filme"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/listFilmes.css">
<style>
	:root{
    --body:#201B2C;
    --border: #77FFC0;
    --font:#77FFC0;
    --font2:#201B2C;
    --input:#6F9E88; 
    --table-body: #D9D9D9;
    --voltar: #46396459;
}
*{
    margin: 0;
    padding: 0;
}
body{
    background-color: var(--body);
    height: 100vh;
}
table{
    color: #FFFFFF;
    border-collapse: collapse;
    margin: auto;
    margin-top: 20px;
}
tr,th,td{
    border: 1px solid var(--input);
    padding: 10px;
}
h1{
    color: var(--font);
    text-align: center;
}
.hr{
    border: 2px solid #77FFC0;
}
a{
    padding: 10px;
}
.voltar{
    background-color: var(--voltar);
    padding: 15px 90px;
    border-radius: 10px;
}

.voltar:hover{
    background-color: var(--input);
}
</style>
</head>
<body>
	<a href="../siteMain.jsp" class="voltar"><img src="arrowLeft.svg" alt=""></a>
    <h1>Filmes</h1>
    <div class="hr"></div>
    <% 
    // Cria uma instância do SelectDao
    FilmesDao filmeDao = new FilmesDao();
    
    try {
        // Chama o método listarLivros para obter a lista de livros
        List<Filme> filmes = filmeDao.listarFilmes();
        
        if (filmes!= null && !filmes.isEmpty()) {
            // Exibe a tabela com os dados dos livros
    %>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Título</th>
                        <th>Descrição</th>
                        <th>Duração</th>
                        <th>Data de Lançamento</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    // Itera sobre a lista de livros e exibe cada um deles na tabela
                    for (Filme filme : filmes) {
                    %>
                        <tr>
                            <td><%= filme.getIdFilme() %></td>
                            <td><%= filme.getTitulo() %></td>
                            <td><%= filme.getDescricao() %></td>
                            <td><%= filme.getDuracao() %></td>
                            <td><%= filme.getDate() %></td>
                           	<td><a href="./editFilme.jsp?id=<%= filme.getIdFilme() %>"><img alt="edit" src="edit.svg"></a></td>
                            <td><a href="./respostaDelete.jsp?id=<%= filme.getIdFilme() %>"><img alt="delete" src="delete.svg"></a></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
    <% 
        } else {
            // Exibe uma mensagem caso não haja livros cadastrados
    %>
            <p>Não há Filmes cadastrados.</p>
    <% 
        }
    } catch (SQLException e) {
        // Exibe uma mensagem de erro caso ocorra uma exceção ao obter a lista de livros
    %>
        <p>Ocorreu um erro ao obter a lista de Filmes.</p>
    <% 
        }
    %>
</body>
</html>