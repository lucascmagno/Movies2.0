<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link href="../css/CadEdit.css">
<style>
:root{
    --body:#201B2C;
    --submit: #77FFC0;
    --font:#77FFC0;
    --font2:#201B2C;
    --input:#6F9E88; 
    --voltar: #46396459;
}
*{
    margin: 0;
}
body{
    background-color: var(--body);
    height: 100vh;
}

h1{
    color: var(--font);
    text-align: center;
}
.hr{
    border: 2px solid #77FFC0;
}

.voltar{
    background-color: var(--voltar);
    padding: 15px 90px;
    border-radius: 10px;
}
.voltar:hover{
    background-color: var(--input);
}

.div-form{
    width: 100%;
    height: 80%;
    display: flex;
    align-content: center;
    align-items: center;
    justify-content: center;
}
form{
    display: flex;
    flex-direction: column;
    justify-content: center;
    width: 50%;
    margin: auto;
    color: var(--font);
    gap: 10px;
}

label{
    font-size: 1.5em;
}

input,textarea,select{
    background-color: #6F9E88;
}

.input{
    height: 50px;
    border-radius: 30px;
}
.input, textarea{
    text-indent: 00;
    font-size: 1.4em;
}
textarea{
    padding-top: 10px;
    border-radius: 30px;
}
.submit{
    height: 50px;
    width: 200px;
    background-color: var(--submit);
    border: none;
    border-radius: 30px;
    color: var(--font2);
    font-weight: bold;
    margin: auto;
    margin-top: 00;
}
.submit:hover{
    cursor: pointer;
    background-color: #6F9E88;
    color: var(--font);
}
.dateTime{
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    gap: 30px;
}
.time{
    width: 60%;
}
.time > input, .date > input{
    height: 50px;
    width: 140px;
    border-radius: 00;
}
</style>
</head>
<body>
    <a href="../siteMain.jsp" class="voltar"><img src="arrowLeft.svg" alt=""></a>
    <h1>Cadastro de Filmes</h1>
    <div class="hr"></div>
    <div class="div-form">
        <form action="respostaFilme.jsp" method="post">
            <label for="ititulo">Título</label>
            <input class="input" type="text" id="ititulo" name="titulo">
            <label for="idescricao">Descrição</label>
            <textarea name="descricao" id="idescricao" cols="30" rows="10"></textarea>
            <div class="dateTime">
                <div class="time">
                    <label for="iduracao">Duração</label>
                    <input type="time" name="duracao" id="iduracao">
                </div>
                <div class="date">
                    <label for="idataLancamento">Data de Lançamento</label>
                    <input type="date" name="data" id="idataLancamento">
                </div>
            </div>
            <input class="submit" type="submit" value="Cadastrar">
        </form>
    </div>
</body>
</html>
