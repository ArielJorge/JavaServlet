package ifgoiano.edu.br.repositorio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import ifgoiano.edu.br.exceptions.DataBaseException;

public class FabricaDeConexao {

	public static Connection getConnection() throws DataBaseException {
		Connection connection = null;
		
		try {
			connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
		} catch (SQLException e) {
			throw new DataBaseException("Ocorreu um erro ao conectar com o banco de dados", e);
		}
		
		return connection;
	}
}
