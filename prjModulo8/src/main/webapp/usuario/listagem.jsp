<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Página de listagem</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        #tab{
            margin-top: 50px;
            margin: auto;
            max-width: 85vw;
        }

        #tab tr:hover{
            background: rgb(207, 206, 206);
        }
        
        #bot{
            width: 100px;
            margin-top: 25px;
            margin-left: auto;
            margin-right: auto;
        }
        
        #bot_bot{
            width: 100px;
        }
    </style>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<body>
<div class="container my-4" style="max-width: 850px;">
	<h1 class="display-4" style="text-align: center; margin-top: 18px;">Usuarios Cadastrados</h1>
	<br>
	<div id="table_bx">
   <table class="table table-bordered" id="tab">
       <thead class="table-dark">
         <tr>
           <th scope="col">Nome</th>
           <th scope="col">E-mail</th>
           <th scope="col">Data de Cadastro</th>
           <th scope="col"></th>
         </tr>
       </thead>
       <tbody>
          <c:forEach items="${usuarios}" var="usuario">
                <tr>
                  <td>${usuario.nome}</td>
                  <td>${usuario.email}</td>
                  <td class="text-center">${usuario.data}</td>
                  <td>
                  	<div class="container">
                  		<div class="row">
                  			<div class="col-md-6 p-0">
                  				<form action="editar">
                  					<input type="text" value="${usuario.nome}" id="nome" name="nome" class="d-none">
                  					<center>
		                  				<button class="btn"><a href="editarUsuario.jsp"></a><i class="bi bi-pencil-square"></i></button>
		                  			</center>
		                  		</form>
                  			</div>
                  			<div class="col-md-6 p-0">
                  				<form action="deletar">
                  					<input type="text" value="${usuario.nome}" id="nome" name="nome" class="d-none">
                  					<center>
		                  				<button class="btn"><i class="bi bi-trash"></i></button>
		                  			</center>
		                  		</form>
                  			</div>
                  		</div>
                  	</div>
                  </td>
                </tr>
          </c:forEach>
      </tbody>
    </table>
    </div>
	<div id="bot">
		<a href="index.jsp" id="bot_bot" class="btn btn-secondary">Voltar</a>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>