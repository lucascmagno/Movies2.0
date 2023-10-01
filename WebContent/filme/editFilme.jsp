<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Movies.dao.FilmesDao"%>
<%@page import="Movies.model.Filme"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/CadEdit.css">
<style>
:root{
    --body:#201B2C;
    --submit: #77FFC0;
    --font:#77FFC0;
    --font2:#201B2C;
    --input:#6F9E88; 
    --voltar: #46396459;
}
*{
    margin: 0;
}
body{
    background-color: var(--body);
    height: 100vh;
}

h1{
    color: var(--font);
    text-align: center;
}
.hr{
    border: 2px solid #77FFC0;
}

.voltar{
    background-color: var(--voltar);
    padding: 15px 90px;
    border-radius: 10px;
}
.voltar:hover{
    background-color: var(--input);
}

.div-form{
    width: 100%;
    height: 80%;
    display: flex;
    align-content: center;
    align-items: center;
    justify-content: center;
}
form{
    display: flex;
    flex-direction: column;
    justify-content: center;
    width: 50%;
    margin: auto;
    color: var(--font);
    gap: 10px;
}

label{
    font-size: 1.5em;
}

input,textarea,select{
    background-color: #6F9E88;
}

.input{
    height: 50px;
    border-radius: 30px;
}
.input, textarea{
    text-indent: 00;
    font-size: 1.4em;
}
textarea{
    padding-top: 10px;
    border-radius: 30px;
}
.submit{
    height: 50px;
    width: 200px;
    background-color: var(--submit);
    border: none;
    border-radius: 30px;
    color: var(--font2);
    font-weight: bold;
    margin: auto;
    margin-top: 00;
}
.submit:hover{
    cursor: pointer;
    background-color: #6F9E88;
    color: var(--font);
}
.dateTime{
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    gap: 30px;
}
.time{
    width: 60%;
}
.time > input, .date > input{
    height: 50px;
    width: 140px;
    border-radius: 00;
}
</style>
</head>
<body>
	<a href="../siteMain.jsp" class="voltar"><img src="arrowLeft.svg" alt=""></a>
    <h1>Editar Filme</h1>
    <div class="hr"></div>
    <div class="div-form">
     <%
    // Obter o ID do livro a ser editado a partir dos parâmetros da requisição
    int filmeId = Integer.parseInt(request.getParameter("id"));
    
    // Criar uma instância do DAO
    FilmesDao filmesDao = new FilmesDao();
    
    try {
        // Obter o livro com base no ID fornecido
        Filme filme = filmesDao.getFilmeById(filmeId);
        
        if (filme != null) {
    %>
        <form action="respostaEdit.jsp" method="post">
        	<input name="id" type="hidden" value="<%= filme.getIdFilme() %>">
            <label for="ititulo">Título</label>
            <input class="input" type="text" id="ititulo" name="titulo" value="<%= filme.getTitulo() %>">
            <label for="idescricao">Descrição</label>
            <textarea name="descricao" id="idescricao" cols="30" rows="10"><%= filme.getDescricao() %></textarea>
            <div class="dateTime">
                <div class="time">
                    <label for="iduracao">Duração</label>
                    <input type="time" name="duracao" id="iduracao" value="<%=filme.getDuracao() %>">
                </div>
                <div class="date">
                    <label for="idataLancamento">Data de Lançamento</label>
                    <input type="date" name="data" id="idataLancamento" value="<%=filme.getDate() %>">
                </div>
            </div>
            <input class="submit" type="submit" value="Editar">
        </form>
        
         <% } else { %>
    <p>O Filme não foi encontrado.</p>
    <% } %>
    <% } catch (SQLException e) { %>
    <p>Ocorreu um erro ao obter os dados do Filme: <%= e.getMessage() %></p>
    <% } %>
    </div>
</body>
</html>