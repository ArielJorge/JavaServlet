package ifgoiano.edu.br.controles;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ifgoiano.edu.br.entidades.Usuario;
import ifgoiano.edu.br.negocios.UsuarioNegocio;
import ifgoiano.edu.br.repositorio.Repositorio;

@WebServlet(urlPatterns = "/usuario/registro")
public class RegistroServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5507675602387608489L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nome");
		String email = req.getParameter("email");
		String senha = req.getParameter("senha");
		
		boolean isPasswordOkay = new UsuarioNegocio().verificarSenha(senha);
		
		if(!isPasswordOkay) {
			//redirecionar para a pagina de registro com mensagem de erro
			req.setAttribute("mensagem2", "Senha inválida, deve-se conter ao menos 6 caracteres.");
			req.getRequestDispatcher("cadastro.jsp").forward(req, resp);
		}else {
			//se for encontrado um usuario com o nome informado, ent�o n�o cadastrar
			boolean isUserParameterOkay = new Repositorio().pegarPorNome(nome) != null ? false : true;
			
			if(isUserParameterOkay) {
				Usuario usuario = new Usuario();
				usuario.setNome(nome);
				usuario.setEmail(email);
				usuario.setSenha(senha);
				usuario.setData(LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")).toString());
				new Repositorio().inserir(usuario);
				
				req.setAttribute("mensagem1", "cadastro realizado com sucesso!");
				req.getRequestDispatcher("cadastro.jsp").forward(req, resp);
			}else {
				//redirecionar para a pagina de registro com mensagem de erro
				req.setAttribute("mensagem2", "Usuário não cadastrado, tente alterar e-mail ou senha.");
				req.getRequestDispatcher("cadastro.jsp").forward(req, resp);
			}
		}
	}
}
