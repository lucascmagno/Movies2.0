<%@page import="Movies.dao.FavoritoDao"%>
<%@page import="Movies.model.Favorito"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
FavoritoDao favoritoDao = new FavoritoDao();
Favorito favorito = new Favorito();

HttpSession sessao = request.getSession(false); // Use false para não criar uma nova sessão, caso não exista
if (sessao != null) {
    String nomeUsuario = (String) sessao.getAttribute("nomeUsuario"); // Corrigido de session para sessao
    if (nomeUsuario != null) {
        // Obtenha o ID do filme a partir do parâmetro e converta para int
        int idFilme = Integer.parseInt(request.getParameter("idFilme"));
        
        favorito.setIdFilme(idFilme);
        favorito.setUsuario(nomeUsuario); // Defina o nome do usuário no objeto Favorito

        int idUsuario = favoritoDao.returnIdFavorito(nomeUsuario);
        if (idUsuario > 0) {
            favorito.setIdUsuario(idUsuario);
        } else {
            // Exiba uma mensagem de erro e redirecione
            %><script>
            alert("Erro ao adicionar na lista de favoritos, ID inválido");
            window.location.href = "./siteMain.jsp"; // Corrigido de window.href para window.location.href
            </script><%
            return; // Encerre o processamento da página
        }
        
        boolean ok = favoritoDao.inserirFavorito(favorito);
        if (ok) {
            // Exiba uma mensagem de sucesso e redirecione
        %>
        <script type="text/javascript">
            alert("Adicionado na lista de favoritos com sucesso!");
            window.location.href = "./siteMain.jsp"; // Corrigido de window.href para window.location.href
        </script>
        <%
        } else {
            // Exiba uma mensagem de erro e redirecione
        %>
        <script type="text/javascript">
            alert("Erro ao adicionar na lista de favoritos");
            window.location.href = "./siteMain.jsp"; // Corrigido de window.href para window.location.href
        </script>
        <%
        }
    } else {
        // O atributo "nomeUsuario" não está na sessão
    	%>
        <script type="text/javascript">
        alert("Faça login para poder adicionar na sua lista de favoritos");
        window.location.href = "./loginUsuario.jsp"; // Corrigido de window.href para window.location.href
        </script>
        <%
    }
} else {
    // Não há sessão existente
	%>
    <script type="text/javascript">
        alert("Faça login para poder adicionar na sua lista de favoritos");
        window.location.href = "./loginUsuario.jsp"; // Corrigido de window.href para window.location.href
    </script>
    <%
}
%>
