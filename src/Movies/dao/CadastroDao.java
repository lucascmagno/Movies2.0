package Movies.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import Movies.model.LoginCadastro;
import Movies.util.Conexao;

public class CadastroDao {
	public boolean inserirUsuario(LoginCadastro c) {

		Conexao con = null;

		try {
			con = new Conexao();
			con.executeUpdate("INSERT INTO usuario(usuario, email, senha) VALUES('"+c.getUsuario()+"',"
					+ "'"+c.getEmail()+"',"
					+ "'"+c.getSenha()+"') ;");
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
	
	public LoginCadastro login (String usuario, String senha) {
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet rs = con.executeQuery("SELECT * FROM usuario WHERE usuario = '"+usuario+"' AND senha='"+senha+"';");
			System.out.println("Sucesso no Login");
			if(rs.next()) {
				return new LoginCadastro(
					rs.getString("usuario"),
					rs.getString("senha")
				);
			}else {
				return null;
			}
		}catch(SQLException e){
			System.out.println("erro ao ler os dados da tabela");
			return null;
		}
	}

}
