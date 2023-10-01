<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/styleLogin.css">
</head>
<body>
    <h1>Login</h1>
    <form class="form" action="respostaLogin.jsp" method="post">
        <span class="input-span">
        <label for="usuario" class="label">Usuário</label>
        <input type="text" name="usuario" id="usuario"></span>
        <span class="input-span">
        <label for="password" class="label">Password</label>
        <input type="password" name="senha" id="password"></span>
        <span class="span"><a href="#">Esqueceu a senha?</a></span>
        <input class="submit" type="submit" value="Log in">
        <span class="span">Ainda não tem conta? <a href="./cadastrarUsuario.jsp">Cadastrar</a></span>
      </form>
</body>
</html>