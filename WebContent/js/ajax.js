 function enviarDados() {
    var filmesDiv = document.getElementById('filmes');
    var titulo = filmesDiv.querySelector('.info h1').textContent;
    var data = filmesDiv.querySelector('.info .date').textContent;
    var duracao = filmesDiv.querySelector('.info .duracao').textContent;
    var categoria = filmesDiv.querySelector('.info .categoria').textContent;
    var descricao = filmesDiv.querySelector('.info .descricao').textContent;

    var dados = {
        titulo: titulo,
        data: data,
        duracao: duracao,
        categoria: categoria,
        descricao: descricao
    };

    fetch('../filme/respostaFilme.jsp', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(dados)
    })
    .then(function(response) {
        // Lógica para o que você deseja fazer com a resposta do servidor
        console.log("Dados enviados com sucesso!");
    })
    .catch(function(error) {
        console.log("Ocorreu um erro ao enviar os dados.");
    });
}
    // Chame a função enviarDados() quando o botão for clicado
    var botao = document.querySelector('button');
