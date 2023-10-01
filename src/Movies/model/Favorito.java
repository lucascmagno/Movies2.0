package Movies.model;

public class Favorito {
	private int idFavorito;
	private int idFilme;
	private int idUsuario;
	private String usuario;
	private String filme;
	private String dataLancamento;
	private String duracao;
	
	public Favorito() {
		
	}
	public Favorito(int idFilme, int idUsuario) {
		this.idFilme = idFilme;
		this.idUsuario = idUsuario; 
	}
	
	public int getIdFavorito() {
		return idFavorito;
	}
	public void setIdFavorito(int idFavorito) {
		this.idFavorito = idFavorito;
	}
	
	public int getIdFilme() {
		return idFilme;
	}

	public void setIdFilme(int idFilme) {
		this.idFilme = idFilme;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getFilme() {
		return filme;
	}
	public void setFilme(String filme) {
		this.filme = filme;
	}
	public String getDataLancamento() {
		return dataLancamento;
	}
	public void setDataLancamento(String dataLancamento) {
		this.dataLancamento = dataLancamento;
	}
	public String getDuracao() {
		return duracao;
	}
	public void setDuracao(String duracao) {
		this.duracao = duracao;
	}
	
	
}
