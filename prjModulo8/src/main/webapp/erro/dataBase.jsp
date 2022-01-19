<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de erro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap');

        .font-alfaSlabOne{
            font-family: 'Alfa Slab One', cursive;
        }

        p{
            font-size: 24px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="my-5">
            <div>
                <h3 class="font-alfaSlabOne">Mensagem</h3>
                <p class="ms-4 alert alert-danger">${pageContext.exception.stackTrace[0]}</p>
                <center>
                    <a href="index.jsp" class="btn btn-dark my-3">Voltar</a>
                </center>
            </div>
            <hr>
            <div class="m-5">
                <h3 class="font-alfaSlabOne">Origem</h3>
                <div class="alert alert-danger" role="alert">
                <c:forEach items="${pageContext.exception.stackTrace}" var="exception">
                    <ul>
                        <li><p>${exception}</p></li>
                    </ul>
                </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>