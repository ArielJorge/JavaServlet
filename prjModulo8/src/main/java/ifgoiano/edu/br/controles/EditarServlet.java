package ifgoiano.edu.br.controles;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ifgoiano.edu.br.entidades.Usuario;
import ifgoiano.edu.br.negocios.UsuarioNegocio;
import ifgoiano.edu.br.repositorio.Repositorio;

@WebServlet(urlPatterns = {"/editar", "/usuario/editar"})
public class EditarServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3735326044183871201L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nome");
		String email = req.getParameter("email");
		String senha = req.getParameter("senha");
		
		Usuario usuario = new Usuario();
		usuario.setNome(nome);
		usuario.setEmail(email);
		usuario.setSenha(senha);
		
		UsuarioNegocio negocio = new UsuarioNegocio();
		
		Boolean isPasswordValidated = negocio.verificarSenha(senha);
		
		Repositorio repo = new Repositorio();
		
		if(isPasswordValidated) {
			repo.atualizar(usuario);
			
			List<Usuario> usuarios = repo.pegarTodos();
			req.setAttribute("usuarios", usuarios);
			req.getRequestDispatcher("usuario/listagem.jsp").forward(req, resp);
		}else {
			req.setAttribute("mensagem", "Senha inválida, deve-se conter ao menos 6 caracteres.");
			Usuario usuario2 = repo.pegarPorNome(nome);
			
			req.setAttribute("usuario", usuario2);
			req.getRequestDispatcher("usuario/editarUsuario.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nome");
		Repositorio repo = new Repositorio();
		Usuario usuario = repo.pegarPorNome(nome);
		
		req.setAttribute("usuario", usuario);
		req.getRequestDispatcher("usuario/editarUsuario.jsp").forward(req, resp);
	}
}
