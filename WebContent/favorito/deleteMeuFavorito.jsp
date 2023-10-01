<%@page import="Movies.dao.FavoritoDao"%>
<%@page import="Movies.model.Favorito"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

boolean ok = false;

Favorito favorito = new Favorito();
favorito.setIdFavorito(Integer.parseInt(request.getParameter("id")));

FavoritoDao favoritoDao = new FavoritoDao();
ok = favoritoDao.deleteFavorito(favorito);

if(ok){
%>
<script type="text/javascript">
	alert("removido da lista!");
	window.location.href="./meusFavoritos.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	alert("Erro ao remover da lista");
	window.location.href="./meusFavoritos.jsp";
</script>
<%} %>
    