<%-- 
    Document   : index
    Created on : Mar 5, 2019, 11:47:14 AM
    Author     : a.a.garcia.serrano
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
        <%--  Posibilitar uso de conexión del JSP a BBDD  --%>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookscrud", "root", "");
            Statement s = conexion.createStatement();
            request.setCharacterEncoding("UTF-8");
        %> 

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
                </div>
            </div>
        </div>
        <div class="container">
            <div class="card text-center">
                <div class="card-header">
                    <ul class="nav nav-pills card-header-pills">
                        <li class="nav-item">
                            <a class="nav-link" href="leidos.jsp">Libros ya leidos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="porleer.jsp">Libros por leer</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="sugeridos.jsp">Libros recomendados</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Proximamente más funcionalidades...</a>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Bienvenido a tu librería</h5>
                    <p class="card-text">A través de esta web podrás gestionar tu colección de libros, ya sea para 
                        apuntar cuales son aquellos que tienes y ya has leido, los que tienes pendientes de
                        leer cuando puedas sacar un hueco en esa ajetreada vida que todos llevamos,
                        o simplemente poder recordar cuales son aquellos libros que tus amigos te recomiendan o 
                        que simplemente vistes en alguna ocasión y tienes pendiente pedir para regalo o en tu cumpleaños :)</p>
                    <br>
                    <hr>
                    <p class="card-text">En cada una de las secciones verás el listado de libros pertenecientes ordenados cronologicamente,
                        incluyendo la opción de modificar sus datos, borrarlo en caso de que ya no pertenezca a ese apartado, e inclusive, 
                        poder añadir alguno a la base de datos de ese apartado.</p>
                    <hr>
                    <p class="card-text">En nuevas versiones, se dará la posibilidad de pasar un libro de una a otra sección desde esa misma sección,
                        mejorando la funcionalidad, e inclusive, adjuntar la imagen de la portada de cada libro.</p>

                    <!-- Boton colocado para llamar al modal -->
                    <a class="btn btn-primary btn-lg" href="#" role="button" data-toggle="modal" data-target="#modal1">Comentario del autor</a>

                    <!-- Codigo del modal de BootStrap -->
                    <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
                         aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">Llena tus momentos de inspiración</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Cuando lees, sientes viajar, puedes transportarte a mundos de ensueño donde experimentar
                                    nuevas sensaciones o inclusos vivir aventuras, así que recomiendo encarecidamente que aparques
                                    la pereza, deja el movil en la mesa, apaga el ordenador y lánzate de lleno a devorar un libro,
                                    creeme, no te arrepentirás!
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container text-dark text-center">
            <p><a href="mailto:agscm2@gmail.com?Subject=Valoracion%20y%20comentarios%20del%20BooksCRUD%20sobre%20Java%20y%20JSP" target="_top">© Autor: Alejandro García Serrano</a>
            <dl><dd><a href="https://github.com/Alegarse" target="blank"><i class="fab fa-github"></i></a>
                    <a href="https://www.linkedin.com/in/alegarse" target="blank"><i
                            class="fab fa-linkedin"></i></a>
                    <a href="https://twitter.com/Alegarse" target="blank"><i
                            class="fab fa-twitter-square"></i></a>
                </dd>
            </dl>
        </div>
    </body>
</html>

