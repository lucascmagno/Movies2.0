package Movies.dao;

import Movies.model.Filme;


import Movies.util.Conexao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class FilmesDao {
    
    public List<Filme> listarFilmes() throws SQLException {
        Conexao con = null;
        
        List<Filme> lfilmes = new ArrayList<>();
        try {
            con = new Conexao();
            ResultSet rs = con.executeQuery("SELECT * FROM filme;");
            while (rs.next()) {
                Filme filme = new Filme();
                filme.setIdFilme(rs.getInt("idFilme"));
                filme.setTitulo(rs.getString("titulo"));
                filme.setDescricao(rs.getString("descricao"));
                filme.setDuracao(rs.getString("duracao"));
                filme.setDate(rs.getString("data_lancamento"));
                lfilmes.add(filme);
            }
        } finally {
            if (con != null) {
                con.fecharConexao();
            }
        }

        return lfilmes;
    }
    
    public Filme getFilmeById(int id) throws SQLException {
        Conexao con = null;

        try {
            con = new Conexao();
            ResultSet rs = con.executeQuery("SELECT * FROM filme WHERE idfilme=" + id);
            
            if (rs.next()) {
            	Filme filme = new Filme();
            	filme.setIdFilme(rs.getInt("idFilme"));
                filme.setTitulo(rs.getString("titulo"));
                filme.setDescricao(rs.getString("descricao"));
                filme.setDuracao(rs.getString("duracao"));
                filme.setDate(rs.getString("data_lancamento"));
                
                return filme;
            }
            return null;
            
        } finally {
            if (con != null) {
                con.fecharConexao();
            }
        }
    }
    
    public boolean inserirFilme(Filme filme) {
        Conexao con = null;

        try {
            con = new Conexao();
            String query = "INSERT INTO  filme (titulo, descricao, duracao, data_lancamento) " +
                    "VALUES ('" + filme.getTitulo() + "', '" + filme.getDescricao() + "', '" +
                    filme.getDuracao() + "', '" + filme.getDate() + "')";
            con.executeUpdate(query);

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updateFilme(Filme filme) {
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("UPDATE filme SET titulo='"+filme.getTitulo()+"', descricao='"+filme.getDescricao()+"', duracao='"+filme.getDuracao()+"',"
					+ " data_lancamento='"+filme.getDate()+"' "
	                + "WHERE idFilme="+filme.getIdFilme()+";");
			return true;
		}catch(SQLException e){
			return false;
		}
	}
	public boolean deleteFilme(Filme filme) {
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("DELETE FROM filme WHERE idFilme="+filme.getIdFilme());
			return true;
		}catch(SQLException e){
			return false;
		}
	}

}
