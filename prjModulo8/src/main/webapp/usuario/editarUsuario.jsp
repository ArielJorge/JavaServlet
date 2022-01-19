<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de edição</title>

    <!-- CSS only -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <style>
        * {
            box-sizing: border-box;
            padding: 0;
            margin: 0;
        }
        
        #cont {
            margin-top: 5vh;
        }

        form{
            margin-top: 50px;
        }
        
        #txt {
            text-align: center;
            background-color: rgba(208, 213, 219, 0.466);
            padding: 50px;
            font-weight: 400;
            font-size: 16px;
        }
        
        #tit {
            font-weight: 300;
            font-size: 52px;
        }

        header ul {
            display: flex;
        }
        
        #div {
            margin-left: 5%;
            background-color: rgba(43, 43, 46, 0.253);
            width: 89%;
            height: 2px;
        }
        
        header ul li {
            list-style: none;
            margin-left: 5px;
        }
        
        header ul li a {
            text-decoration: none;
            padding: 6px 15px;
            color: #fff;
            border-radius: 20px;
        }
        
        header ul li a:hover {
            border-radius: 20px;
            padding: 6px 15px;
            background: #fff;
            color: #1c0b36;
        }
        
        @media (max-width:991px) {
            header ul li {
                padding: 5px 0 10px 0;
            }
        }
    </style>
</head>
<body>
    <section class="container" id="cont">
        <div id="txt">
          <h1 id="tit">Alteração de Usuário</h1>
          <p>Edite as informações de sua conta de usuario abaixo</p>
          <div id="div"></div>
        </div>
        <form action="editar" method="post">
          <div class="form-group row">
            <label for="nome" class="col-4 col-form-label">Nome</label> 
            <div class="col-8">
              <input id="nome" name="nome" type="text" class="form-control" value="${usuario.nome}" readonly>
            </div>
          </div>
          <div class="form-group row">
            <label for="email" class="col-4 col-form-label">Email</label> 
            <div class="col-8">
              <input id="email" name="email" placeholder="email@gmail.com" type="text" class="form-control" value="${usuario.email}" required="required">
            </div>
          </div>
          <div class="form-group row">
            <label for="senha" class="col-4 col-form-label">Senha</label> 
            <div class="col-8">
              <input id="senha" name="senha" placeholder="senha" type="password" class="form-control" required="required">
            </div>
          </div> 
          <div class="form-group row">
            <div class="offset-4 col-8">
            	<input type="submit" class="btn btn-primary" value="Salvar">
             	<a href="index.jsp" class="btn btn-secondary">Voltar</a>
            </div>
          </div>
          <c:if test="${not empty mensagem}">
            <div class="alert alert-danger text-center" role="alert">
            	${mensagem}
            </div>
           </c:if>
        </form>
    </section>
</body>
</html>