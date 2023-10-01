<%@page import="Movies.dao.FavoritoDao"%>
<%@page import="Movies.model.Favorito"%>
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
    <h1>Todos os favoritos</h1>
    <div class="hr"></div>
    <% 
    // Cria uma instância do SelectDao
    FavoritoDao favoritoDao = new FavoritoDao();
    
    try {
        // Chama o método listarLivros para obter a lista de livros
        List<Favorito> favoritos = favoritoDao.listarFavoritosAll();
        
        if (favoritos!= null && !favoritos.isEmpty()) {
            // Exibe a tabela com os dados dos livros
    %>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Usuário</th>
                        <th>Filme</th>
                        <th>Data de Lançamento</th>
                        <th>Duração</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    // Itera sobre a lista de livros e exibe cada um deles na tabela
                    for (Favorito favorito : favoritos) {
                    %>
                        <tr>
                            <td><%= favorito.getIdFavorito() %></td>
                            <td><%= favorito.getUsuario() %></td>
                            <td><%= favorito.getFilme() %></td>
                            <td><%= favorito.getDataLancamento() %></td>
                            <td><%= favorito.getDuracao() %></td>
                            <td><a href="./deleteFavorito.jsp?id=<%= favorito.getIdFavorito() %>"><img alt="delete" src="../filme/delete.svg"></a></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
    <% 
        } else {
            // Exibe uma mensagem caso não haja livros cadastrados
    %>
            <p>Não há Nada na lista de favoritos.</p>
    <% 
        }
    } catch (SQLException e) {
        // Exibe uma mensagem de erro caso ocorra uma exceção ao obter a lista de livros
    %>
        <p>Ocorreu um erro ao obter a lista de Favoritos.</p>
    <% 
        }
    %>
</body>
</html>