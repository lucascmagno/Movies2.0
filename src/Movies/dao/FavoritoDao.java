package Movies.dao;

import Movies.util.Conexao;
import Movies.model.Favorito;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FavoritoDao {
	public List<Favorito> listarFavoritosAll() throws SQLException {
        Conexao con = null;
        
        List<Favorito> favoritosAll = new ArrayList<>();
        try {
            con = new Conexao();
            ResultSet rs = con.executeQuery("SELECT fav.idfavorito as id, u.usuario, f.titulo AS filme, f.data_lancamento, f.duracao\r\n"
            		+ "FROM usuario u\r\n"
            		+ "INNER JOIN favorito fav ON u.idUsuario = fav.idUsuario\r\n"
            		+ "INNER JOIN filme f ON fav.idFilme = f.idFilme order by fav.idfavorito;");
            
            while (rs.next()) {
                Favorito favAll = new Favorito();
                favAll.setIdFavorito(rs.getInt("id"));
                favAll.setUsuario(rs.getString("usuario"));
                favAll.setFilme(rs.getString("filme"));
                favAll.setDataLancamento(rs.getString("data_lancamento"));
                favAll.setDuracao(rs.getString("duracao"));
                favoritosAll.add(favAll);
            }
        } finally {
            if (con != null) {
                con.fecharConexao();
            }
        }

        return favoritosAll;
    }
	
	public boolean inserirFavorito(Favorito favorito) {
        Conexao con = null;

        try {
            con = new Conexao();
            String query = "insert into favorito values (null,"+favorito.getIdFilme()+", "+favorito.getIdUsuario()+");";
            con.executeUpdate(query);

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
	
	public int returnIdFavorito(String usuario) {
	    Conexao con = null;

	    try {
	        con = new Conexao();
	        String query = "SELECT idUsuario FROM usuario WHERE usuario = '" + usuario + "'";
	        
	        ResultSet resultSet = con.executeQuery(query);
	        
	        if (resultSet.next()) {
	            // Se encontrar o usuário, obtenha o ID do resultado
	            int idUsuario = resultSet.getInt("idUsuario");
	            return idUsuario;
	        } else {
	            return 0; // Retorna 0 para indicar que o usuário não foi encontrado
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return 0;
	    } finally {
	        if (con != null) {
	            con.fecharConexao();
	        }
	    }
	}
	
	public boolean deleteFavorito(Favorito favorito) {
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("DELETE FROM favorito WHERE idfavorito="+favorito.getIdFavorito());
			return true;
		}catch(SQLException e){
			return false;
		}
	}
	
}
