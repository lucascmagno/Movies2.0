<%@page import="Movies.dao.CadastroDao"%>
<%@page import="Movies.model.LoginCadastro"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

boolean ok = false;

LoginCadastro cadastro = new LoginCadastro();
cadastro.setUsuario(request.getParameter("usuario"));
cadastro.setEmail(request.getParameter("email"));
cadastro.setSenha(request.getParameter("senha"));

CadastroDao cadastroDao = new CadastroDao();
ok = cadastroDao.inserirUsuario(cadastro);

if(ok){
%>
<script type="text/javascript">
	alert("Usuário cadastrado com sucesso!");
	window.location.href="./loginUsuario.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	alert("Erro ao criar Usuário");
	window.href="./cadastrarUsuario.jsp";
</script>
<%} %>
