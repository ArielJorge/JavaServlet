package ifgoiano.edu.br.repositorio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ifgoiano.edu.br.entidades.Usuario;
import ifgoiano.edu.br.exceptions.DataBaseException;

public class Repositorio {

	public void inserir(Usuario usuario) throws DataBaseException {
		String sql = "INSERT INTO USUARIOS (NOME, EMAIL, SENHA, DATA) VALUES (?, ?, ?, ?)";
		Connection conn = FabricaDeConexao.getConnection();
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, usuario.getNome());
			psmt.setString(2, usuario.getEmail());
			psmt.setString(3, usuario.getSenha());
			psmt.setString(4, usuario.getData());
			psmt.execute();
			psmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void atualizar(Usuario usuario) throws DataBaseException {
		String sql = "UPDATE USUARIOS SET EMAIL = ?, SENHA = ? WHERE NOME = ?";
		Connection conn = FabricaDeConexao.getConnection();
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, usuario.getEmail());
			psmt.setString(2, usuario.getSenha());
			psmt.setString(3, usuario.getNome());
			psmt.execute();
			psmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deletar(String nome) throws DataBaseException {
		String sql = "DELETE FROM USUARIOS WHERE NOME = ?";
		Connection conn = FabricaDeConexao.getConnection();
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, nome);
			psmt.execute();
			psmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Usuario pegarUsuario(String email, String senha) throws DataBaseException {
		String sql = "SELECT * FROM USUARIOS WHERE EMAIL = ? AND SENHA = ?";
		Usuario usuario = null;
		Connection conn = FabricaDeConexao.getConnection();
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			psmt.setString(2, senha);
			ResultSet result = psmt.executeQuery();
			while(result.next()) {
				usuario = new Usuario();
				usuario.setNome(result.getString("NOME"));
				usuario.setEmail(result.getString("EMAIL"));
				usuario.setSenha(result.getString("SENHA"));
				usuario.setData(result.getString("DATA"));
			}
			result.close();
			psmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuario;
	}
	
	public Usuario pegarPorNome(String nome) throws DataBaseException {
		String sql = "SELECT * FROM USUARIOS WHERE NOME = ?";
		Usuario usuario = null;
		Connection conn = FabricaDeConexao.getConnection();
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, nome);
			ResultSet result = psmt.executeQuery();
			while(result.next()) {
				usuario = new Usuario();
				usuario.setNome(result.getString("NOME"));
				usuario.setEmail(result.getString("EMAIL"));
				usuario.setSenha(result.getString("SENHA"));
				usuario.setData(result.getString("DATA"));
			}
			result.close();
			psmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuario;
	}
	
	public List<Usuario> pegarTodos() throws DataBaseException{
		String sql = "SELECT * FROM USUARIOS";
		List<Usuario> usuarios = new ArrayList<Usuario>();
		Connection conn = FabricaDeConexao.getConnection();
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			ResultSet result = psmt.executeQuery();
			while(result.next()) {
				Usuario usuario = new Usuario();
				usuario.setNome(result.getString("NOME"));
				usuario.setEmail(result.getString("EMAIL"));
				usuario.setSenha(result.getString("SENHA"));
				usuario.setData(result.getString("DATA"));
				usuarios.add(usuario);
			}
			result.close();
			psmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuarios;
	}
}
