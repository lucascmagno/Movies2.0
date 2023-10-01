<%@page import="Movies.dao.FilmesDao"%>
<%@page import="Movies.model.Filme"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    	body{
    background-color: #201B2C;
}
h1{
    text-align: center;
    color: #83F2BF;
}
nav{
  display: flex;
  gap: 1rem;
  padding: 3px;
}
a{
  padding: 3px;
  text-decoration: none;
  color: #83F2BF;
  font-size: 1.5rem;
  border: 1px solid #6F9E88;
}
a:hover{
    color: #6F9E88;
}
.time-notify{
    border-bottom: 8px solid #6F9E88;
}
.notifications-container {
    width: 100%;
    height: auto;
    font-size: 0.875rem;
    line-height: 1.25rem;
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
    flex-wrap: wrap;
    gap: 1rem;
  }
  
  .flex {
    display: flex;
  }

  .success {
    width: 300px;
    padding: 1rem;
    border-radius: 0.375rem;
    background-color: #6F9E88;
  }
  
  
  .success-prompt-wrap {
    margin-left: 0.75rem;
  }
  
  .success-prompt-heading {
    font-weight: bold;
    color: #201B2C;
  }
  
  .success-prompt-prompt {
    margin-top: 0.5rem;
    color: #201B2C;
  }
  
  .success-button-container {
    display: flex;
    margin-top: 0.875rem;
    margin-bottom: -0.375rem;
    margin-left: -0.5rem;
    margin-right: -0.5rem;
  }
  
  .add-favorite {
    background-color: #ECFDF5;
    color: rgb(22 101 52);
    font-size: 0.875rem;
    line-height: 1.25rem;
    font-weight: bold;
    border-radius: 0.375rem;
    border: none;
    cursor: pointer;
  }
  
  .add-favorite:hover {
    background-color: #D1FAE5;
  }
  
  
  
    </style>
</head>
<body>
    <div class="time-notify">
        <h1>TIME NOTIFY</h1>
    </div>
    <header>
      <nav>
        <a href="./filme/cadastrarFilme.jsp">Cadastrar Filme</a>
        <a href="./filme/listFilmes.jsp">Listar Filmes</a>
        <a href="./favorito/favoritoAll.jsp">Todos os favoritos</a>
        <a href="#">Sua lista de favoritos</a>
      </nav>
    </header>
    <h1>Os mais esperados</h1>
    <div class="notifications-container">
    
    <% 
    // Cria uma instância do SelectDao
    FilmesDao filmeDao = new FilmesDao();
    
    try {
        // Chama o método listarLivros para obter a lista de livros
        List<Filme> filmes = filmeDao.listarFilmes();
        
        if (filmes!= null && !filmes.isEmpty()) {
            // Exibe a tabela com os dados dos livros
    %>
      <% 
      // Itera sobre a lista de livros e exibe cada um deles na tabela
      for (Filme filme : filmes) {
      %>
          <div class="success" id="<%=filme.getIdFilme()%>">
          <div class="flex">
            <div class="success-prompt-wrap">
              <p class="success-prompt-heading">
                <%=filme.getTitulo() %>
              </p>
              <p class="success-prompt-heading">
                <%=filme.getDate() %> / <%=filme.getDuracao() %>
              </p>
              <div class="success-prompt-prompt">
                <p>
                    <%=filme.getDescricao() %>
                </p>
              </div>
                <div class="success-button-container">
                	<a href="respostaAddFavorito.jsp?idFilme=<%=filme.getIdFilme()%>">
                  	<button type="button" class="add-favorite">
                  		<img src="./imgs/Favorite.svg" alt="">
                  	</button>
                	</a>
                </div>
            </div>
          </div>
        </div>
      <% } %>
    <% 
        } else {
            // Exibe uma mensagem caso não haja livros cadastrados
    %>
            <p>Não há Filmes cadastrados.</p>
    <% 
        }
    } catch (SQLException e) {
        // Exibe uma mensagem de erro caso ocorra uma exceção ao obter a lista de livros
    %>
        <p>Ocorreu um erro ao obter a lista de Filmes.</p>
    <% 
        }
    %>
    
    
      </div>
</body>
</html>