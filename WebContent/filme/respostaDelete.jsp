<%@page import="Movies.dao.FilmesDao"%>
<%@page import="Movies.model.Filme"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

boolean ok = false;

Filme filme = new Filme();
filme.setIdFilme(Integer.parseInt(request.getParameter("id")));

FilmesDao filmesDao = new FilmesDao();
ok = filmesDao.deleteFilme(filme);

if(ok){
%>
<script type="text/javascript">
	alert("Filme apagado com sucesso!");
	window.location.href="./listFilmes.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	alert("Erro ao apagar o Filme");
	window.location.href="./listFilmes.jsp";
</script>
<%} %>
    