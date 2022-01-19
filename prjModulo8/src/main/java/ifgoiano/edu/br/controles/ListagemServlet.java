package ifgoiano.edu.br.controles;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ifgoiano.edu.br.entidades.Usuario;
import ifgoiano.edu.br.repositorio.Repositorio;

@WebServlet(urlPatterns = "/listagem")
public class ListagemServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6581892271843389281L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Usuario> usuarios = new Repositorio().pegarTodos();
		req.setAttribute("usuarios", usuarios);
		req.getRequestDispatcher("usuario/listagem.jsp").forward(req, resp);
	}
}
