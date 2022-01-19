package ifgoiano.edu.br.negocios;

import ifgoiano.edu.br.entidades.Usuario;
import ifgoiano.edu.br.exceptions.DataBaseException;
import ifgoiano.edu.br.repositorio.Repositorio;

public class UsuarioNegocio {

	public Boolean verificarSenha(String senha){
		//Teste para quantidade de letras na senha
		if(senha.length() >= 6) {
			return true;
		}else {
			return false;
		}
	}
	
	public Boolean verificarUsuario(String email, String senha) throws DataBaseException {
		//Usuario recebera o retorno do metodo pegarUsuario 
		//Sera atribuido nulo caso nao seja encontrado o usuario
		Usuario usuario = new Repositorio().pegarUsuario(email, senha);
		if(usuario != null) {
			return true;
		}else {
			return false;
		}
	}
}
