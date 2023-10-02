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
header {
    background-color: #201B2C; /* Azul escuro */
    padding: 10px 0;
    padding-left: 20px;
}

header a {
    text-decoration: none;
    color: #83F2BF; /* Verde claro */
    font-weight: bold;
}
	/* CSS com foco nas cores #201B2C (azul escuro) e #83F2BF (verde claro) */
body {
    background-color: #201B2C; /* Azul escuro */
    font-family: Arial, sans-serif;
    color: #ffffff; /* Branco */
    margin: 0;
    padding: 0;
}

a {
    text-decoration: none;
    color: #83F2BF; /* Verde claro */
}

a:hover {
    text-decoration: underline;
}

h1 {
    color: #83F2BF; /* Verde claro */
    text-align: center;
    margin-top: 20px;
}

.hr {
    border-top: 2px solid #83F2BF; /* Verde claro */
    margin: 20px auto;
    width: 80%;
}

table {
    width: 80%;
    margin: 0 auto;
    border-collapse: collapse;
}

table th,
table td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #201B2C; /* Azul escuro */
    color: #ffffff; /* Branco */
}

table th {
    background-color: #201B2C; /* Azul escuro */
    font-weight: bold;
}

table tr:nth-child(even) {
    background-color: #2D2840; /* Azul escuro mais escuro */
}

table tr:hover {
    background-color: #3A3461; /* Azul médio mais escuro */
}

p {
    text-align: center;
    color: #ffffff; /* Branco */
    margin-top: 20px;
}

/* Estilizando os botões Editar e Excluir */
.edit-button,
.delete-button {
    background-color: #83F2BF; /* Verde claro */
    color: #201B2C; /* Azul escuro */
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    border-radius: 5px; 
    margin-right: 5px;
}

.edit-button:hover,
.delete-button:hover {
    background-color: #60D5A3; /* Verde claro mais escuro */
}
</style>
</head>
<body
<header>
    <a href="../siteMain.jsp">Início</a> >
    <a href="#">filmes</a>
</header>
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