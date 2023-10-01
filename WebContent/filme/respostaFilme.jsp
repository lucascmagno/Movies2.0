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

filme.setTitulo(titulo);
filme.setDescricao(descricao);
filme.setDuracao(duracao);
filme.setDate(data);

FilmesDao filmesDao = new FilmesDao();
filmesDao.inserirFilme(filme);

if(ok){
%>
<script type="text/javascript">
	alert("Filme Cadastrado com sucesso!");
	window.location.href="../siteMain.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	alert("Filme Cadastrado com sucesso!");
	window.location.href="../siteMain.jsp";
</script>
<%} %>
