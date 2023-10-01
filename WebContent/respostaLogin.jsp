<%@page import="Movies.dao.CadastroDao"%>
<%@page import="Movies.model.LoginCadastro"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

String usuario = request.getParameter("usuario");
String senha = request.getParameter("senha");

CadastroDao loginDao = new CadastroDao();
LoginCadastro login = loginDao.login(usuario, senha);

HttpSession sessao = request.getSession(true);
sessao.setAttribute("nomeUsuario", usuario);

%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    
    <%-- Cria uma instância do LoginDao --%>
    <%
       if (login != null) {
           response.sendRedirect("./siteMain.jsp");
           
     } else {
           // Exibe uma mensagem de login inválido
    
           response.sendRedirect("./loginUsuario.jsp");
    } %>
</body>
</html>
