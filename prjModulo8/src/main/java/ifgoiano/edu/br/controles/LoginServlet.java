package ifgoiano.edu.br.controles;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ifgoiano.edu.br.negocios.UsuarioNegocio;

@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2844281960054691040L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String senha = req.getParameter("senha");
		
		boolean successLogin = new UsuarioNegocio().verificarUsuario(email, senha);
		
		if(successLogin) {
			req.setAttribute("mensagem1", "Login realizado com sucesso!");
			req.getRequestDispatcher("index.jsp").forward(req, resp);

		}else {
			//redirecionar para a pagina de login com mensagem de erro
			req.setAttribute("mensagem2", "E-mail ou senha não encontrados!!");
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
	}
}
