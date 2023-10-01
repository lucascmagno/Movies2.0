<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/styleLogin.css">
</head>
<body>
    <h1>Cadastrar</h1>
    <form class="form" action="respostaCadastro.jsp" method="post">
        <span class="input-span">
        <label for="usuario" class="label">Usuario</label>
        <input type="text" name="usuario" id="usuario"></span>
        <span class="input-span">
        <label for="email" class="label">Email</label>
        <input type="email" name="email" id="email"></span>
        <span class="input-span">
        <label for="password" class="label">Password</label>
        <input type="password" name="senha" id="password"></span>
        <input class="submit" type="submit" value="Log in">
        <span class="span">Ja tem uma conta? <a href="loginUsuario.jsp">Entrar agora</a></span>
      </form>
</body>
</html>