package ifgoiano.edu.br.exceptions;

import java.sql.SQLException;

import javax.servlet.ServletException;

public class DataBaseException extends ServletException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3327847514695139277L;

	public DataBaseException(String mensagem, SQLException e) {
		super(mensagem, e);
	}
}
