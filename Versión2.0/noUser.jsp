<%-- 
    Document   : index
    Created on : Mar 5, 2019, 11:47:14 AM
    Author     : a.a.garcia.serrano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%-- Para poder usar BootStrap4  --%>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
              integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" 
              crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" 
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" 
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="miestilo.css">

    </head>
    <body>
        <%--  Jumbotron BootStrap de presentación de la Web del CRUD  --%>
        <div class="container">
            <div class="jumbotron jumbotron text-dark bg-warning">
                <div class="container">
                    <div class="row">
                        <div class="col-6">
                            <h1 class="display-4">Books Crud</h1>
                            <hr class="my-4">
                            <p class="lead">Tu gestión de libros con unos pocos clics!</p>
                        </div>
                        <div class="col-6">
                            <img src="Libros.png" class="rounded float-right img-fluid">
                        </div>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title text-center text-danger text-bold">Error. Usuario desconocido.</h5>
                            <hr>
                            <p class="card-text text-center">Ha introducido un nombre de usuario incorrecto no existente en nuestra base de datos.
                                Por favor, vuelva a la pagina de Login para intentarlo de nuevo. Gracias!) </p>
                            <div class="row justify-content-center">
                            <a class="btn btn-outline-info" href="login.jsp">Ir a Login ➤</a>
                            </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>



