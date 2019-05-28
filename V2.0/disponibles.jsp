<%-- 
    Document   : index
    Created on : Mar 5, 2019, 11:47:14 AM
    Author     : a.a.garcia.serrano
--%>
<%@page import="bookscrud.ConexionBBDD"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Para poder usar BootStrap4  -->

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
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
        <link href="favicon.ico" rel="shortcut icon">
        <title>BooksCRUD</title>

    </head>
    <body>
        <!--  Posibilitar uso de conexión del JSP a BBDD  -->

        <%
            Statement s = ConexionBBDD.conecta();
            request.setCharacterEncoding("UTF-8");
        %> 

        <!--  Jumbotron BootStrap de presentación de la Web del CRUD  -->
        <div class="container">
            <div class="jumbotron jumbotron text-dark bg-warning">
                <div class="container">
                    <h1 class="display-4">Books Crud - Libros disponibles</h1>
                    <p class="lead">Tu gestión de libros con unos pocos clics!</p>
                </div>
            </div>
        </div>
        <div class="container">
            <ul class="nav nav-pills justify-content-end">
                <button type="submit" class="btn btn-light border-warning font-weight-bold mt-1 mb-1"><a href="index.jsp">Volver a Inicio ↺</a></button>
            </ul>
        </div>


        <!--  Cargamos los datos de libros de la BBDD a un listado  -->

        <%  ResultSet listado = s.executeQuery("SELECT * FROM libros");   %>


        <div class="container">

            <table class="table table-striped table-dark text-center">
                <tr><th>ISBN</th><th>Autor</th><th>Título</th><th>Sinopsis</th><th>Fecha de publicación</th></tr>

                <!--  Listado de los libros existentes en la BBDD con formateo en tabla  -->

                <%  while (listado.next()) {
                        out.println("<tr><td>");
                        out.println(listado.getString("isbn") + "</td>");
                        out.println("<td>" + listado.getString("autor") + "</td>");
                        out.println("<td>" + listado.getString("titulo") + "</td>");
                        out.println("<td>" + listado.getString("sinopsis") + "</td>");
                        out.println("<td>" + listado.getString("fecha") + "</td>");

                %>


                <!--  Terminamos la conexión a la BBDD cerrando el bucle While  -->

                <%}%>

        </div>

    </body>
</html>
