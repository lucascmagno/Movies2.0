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
<title>Minha Lista de Favoritos</title>
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
body {
    background-color: #201B2C;
}

h1 {
    text-align: center;
    color: #83F2BF;
}

.notifications-container {
    width: 100%;
    height: auto;
    font-size: 0.875rem;
    line-height: 1.25rem;
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
    flex-wrap: wrap;
    gap: 1rem;
}

.flex {
    display: flex;
}

.success {
	width: 320px;
    padding: 1rem;
    border-radius: 0.375rem;
    background-color: #6F9E88;
}

.success-prompt-wrap {
    width: 100%;
    margin-left: 0.75rem;
}

.success-prompt-heading {
    font-weight: bold;
    color: #201B2C;
}

.success-prompt-prompt {
    margin-top: 0.5rem;
    color: #201B2C;
}

.success-button-container {
    display: flex;
    justify-content: flex-end;
    margin-top: 0.875rem;
    margin-bottom: -0.375rem;
    margin-left: -0.5rem;
    margin-right: -0.5rem;
}

.add-favorite {
    padding-top: 0.375rem;
    padding-bottom: 0.375rem;
    padding-left: 0.5rem;
    padding-right: 0.5rem;
    background-color: #201B2C;
    color: rgb(22 101 52);
    font-size: 0.875rem;
    line-height: 1.25rem;
    font-weight: bold;
    border-radius: 0.375rem;
    border: none;
    cursor: pointer;
}

.add-favorite:hover {
	color: #201B2C;
    background-color: #D1FAE5;
}

</style>
</head>
<body>
<header>
    <a href="../siteMain.jsp">Início</a> >
    <a href="#">Meus favoritos</a>
</header>
<h1>Minha Lista de Favoritos</h1>
<div class="hr"></div>

<%
// Cria uma instância do FavoritoDao
FavoritoDao favoritoDao = new FavoritoDao();
Favorito fav = new Favorito();
HttpSession sessao = request.getSession(false); // Use false para não criar uma nova sessão, caso não exista

if (sessao != null) {
    String nomeUsuario = (String) sessao.getAttribute("nomeUsuario");

    if (nomeUsuario != null) {
        try {
            // Chame o método para obter a lista de favoritos
            fav.setUsuario(nomeUsuario);
            List<Favorito> favoritos = favoritoDao.listarFavoritosLogado(fav);

            if (favoritos != null && !favoritos.isEmpty()) {
                // Exiba a lista de favoritos
%>
<div class="notifications-container">
    <%
        for (Favorito favorito : favoritos) {
    %>
    <div class="success">
        <div class="flex">
            <div class="success-prompt-wrap">
                <p class="success-prompt-heading">
                    <%=favorito.getFilme() %>
                </p>
                <p class="success-prompt-prompt">
                    <%=favorito.getDataLancamento() %> / <%=favorito.getDuracao() %>
                </p>
                <div class="success-button-container">
                <a href="./deleteMeuFavorito.jsp?id=<%=favorito.getIdFavorito()%>">
                    <button type="button" class="add-favorite">
                    	<img alt="" src="../filme/delete.svg">
                    </button>
                </a>
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>
<%
            } else {
                // Não há favoritos cadastrados
    %>
<p style="color: #fff;">Não há nada na lista de favoritos.</p>
<%
            }
        } catch (SQLException e) {
            // Exiba uma mensagem de erro caso ocorra uma exceção ao obter a lista de favoritos
    %>
<p style="color: #fff;">Ocorreu um erro ao obter a sua lista de favoritos.</p>
<%
        }
    } else {
        // O atributo "nomeUsuario" não está na sessão
    %>
<script type="text/javascript">
    alert("Realize login para visualizar a sua lista de favoritos");
    window.location.href = "../loginUsuario.jsp";
</script>
<%
    } // Fim do if (nomeUsuario != null)
} else {
    // Não há sessão existente
%>
<script type="text/javascript">
    alert("Faça login para poder visualizar a sua lista de favoritos");
    window.location.href = "../loginUsuario.jsp";
</script>
<%
}
%>
</body>
</html>
