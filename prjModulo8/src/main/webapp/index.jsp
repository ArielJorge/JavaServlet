<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de login</title>
    <!-- fizemos o css em um arquivo separado, porém ele não estava sendo chamado após a configuração do filter,
    	portanto fizemos dentro do jsp.
     -->
    <style type="text/css">
    	*{
		    padding: 0;
		    margin: 0;
		    box-sizing: border-box;
		}
		
		body {
		    color: #000;
		    overflow-x: hidden;
		    height: 100vh;
		    background-image: linear-gradient(to right, #D500F9, #FFD54F);
		}
		
		#nome, #email, #senha{
		    background-color: #F3E5F5;
		    border-radius: 50px;
		    padding: 12px 15px 12px 15px;
		    width: 100%;
		    box-sizing: border-box;
		    border: none;
		    border: 1px solid #F3E5F5;
		    font-size: 16px;
		    color: #000;
		    font-weight: 400;
		}
		
		#nome:focus, #email:focus, #senha:focus{
		    -moz-box-shadow: none;
		    -webkit-box-shadow: none;
		    box-shadow: none;
		    border: 1px solid #D500F9;
		    outline-width: 0;
		    font-weight: 400;
		}
		
		.form-control-label {
		    font-size: 12px;
		    margin-left: 15px;
		}
		
		.msg-info {
		    padding-left: 15px;
		    margin-bottom: 30px;
		}
		
		.btn-color {
		    border-radius: 50px;
		    color: #fff;
		    background-image: linear-gradient(to right, #FFD54F, #D500F9);
		    padding: 15px;
		    cursor: pointer;
		    border: none;
		    margin-top: 40px;
		}
		
		.btn-color:hover {
		    color: #fff;
		    background-image: linear-gradient(to right, #D500F9, #FFD54F);
		}
		
		#btn2 {
		    width: 150px;
		    box-sizing: border-box;
		    border-radius: 50px;
		    color: #fff;
		    background-image: linear-gradient(to right, #575757,#151615);
		    padding: 15px;
		    cursor: pointer;
		    border: none;
		}
		
		#btn2:hover {
		    box-sizing: border-box;
		    border-radius: 50px;
		    color: #fff;
		    background-image: linear-gradient(to right, #151615,#575757);
		    padding: 15px;
		    cursor: pointer;
		    border: none;
		}
		
		.sm-text {
		    font-size: 15px;
		}
		
		@media screen and (max-width: 992px) {
		
		    .card1 {
		        width: 100%;
		        padding: 40px 30px 10px 30px;
		        margin: auto;
		    }
		    .card2 {
		        width: 100%;
		        margin: auto;
		    }
		    .right {
		        margin-top: 100px;
		        margin-bottom: 100px;
		    }
		}
		
		@media screen and (max-width: 668px) {
		
		    .container {
		        padding: 10px;
		        margin: auto;
		    }
		    .card2 {
		        padding: 50px;
		        margin: auto;
		    }
		    .right {
		        margin-top: 50px;
		        margin-bottom: 50px;
		        margin: auto;
		    }
		}
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>

<body>
    <section id="login" class="container" style="margin-top: -15px;">
      <form action="login" method="post">
        <div class="container px-4 py-5 mx-auto row">
            <div class="card card1 row" style="width: 400px; margin: auto; margin-top: 3vh;">
                <div class="row justify-content-center my-auto" style="padding: 30px, 15px;">
                    <div class="col-md-8 col-10 my-5">
                        <h4 class="mb-5 text-center heading display-6">Bem vindo!</h4>
                        <div class="text-center">
 	                       <h6 class="msg-info" style="font-weight: 400;">Entre com a sua conta</h6>
                        </div>
                        <c:if test="${not empty mensagem1}">
	                        <div class="alert alert-success text-center" role="alert">
	                        	${mensagem1}
	                        </div>
                        </c:if>
                        <c:if test="${not empty mensagem2}">
	                        <div class="alert alert-danger text-center" role="alert">
	                        	${mensagem2}
	                        </div>
                        </c:if>
                        <div class="form-group">
                        	<label class="form-control-label text-muted">Email</label>
                        	<input type="email" id="email" name="email" placeholder="email@gmail.com" class="form-control" style="background-color: rgb(231, 222, 222);" required="required">
                        </div>
                        <div class="form-group">
                        	<label class="form-control-label text-muted">Senha</label>
                        	<input type="password" id="senha" name="senha" placeholder="senha" class="form-control" style="background-color: rgb(231, 222, 222);" required="required">
                        </div>
                        <label class="form-control-label text-muted" style="margin-top: 20px;">Não tem uma conta ? cadastre uma nova <a href="usuario/cadastro.jsp">aqui</a></label>
                        <div class="row justify-content-center my-3 px-3"> <button type="submit" class="btn-block btn-color" style="margin-top: 15px;">Entrar</button> </div>
                        <a href="listagem" class="btn btn-secondary" id="btn2" style="margin-left: 32px;">Consultar</a>
                    </div>
                </div>        
            </div>    
        </div>
      </form>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>

</html>