<%@page import="Movies.dao.FilmesDao"%>
<%@page import="Movies.model.Filme"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

boolean ok = false;

String titulo = request.getParameter("titulo");
String descricao = request.getParameter("descricao");
String duracao = request.getParameter("duracao");
String data = request.getParameter("data");

Filme filme = new Filme();

filme.setIdFilme(Integer.parseInt(request.getParameter("id")));
filme.setTitulo(titulo);
filme.setDescricao(descricao);
filme.setDuracao(duracao);
filme.setDate(data);

FilmesDao filmesDao = new FilmesDao();
filmesDao.updateFilme(filme);

if(ok){
%>
<script type="text/javascript">
	alert("Filme atualizado com sucesso!");
	window.location.href="./listFilmes.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	alert("Filme atualizado com sucesso!");
	window.location.href="./listFilmes.jsp";
</script>
<%} %>
