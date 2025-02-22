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
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" 
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" 
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="miestilo.css"

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
                    <h1 class="display-4">Books Crud - Libros recomendados</h1>
                    <p class="lead">Tu gestión de libros con unos pocos clics!</p>
                </div>
            </div>
        </div>

        <%--  Cargamos los datos de la BBDD a un listado  --%>

        <%
            ResultSet listado = s.executeQuery("SELECT * FROM sugeridos");

        %>

        <%--  Dentro de este contenedor usamos un fondo personalizado  --%>
        <div class="container-fluid">

            <%--  Cabecera para la posibilidad de introducir los datos de un nuevo libro  --%>

            <table class="table table-striped table-dark text-center">
                <tr><th>ISBN</th><th>Autor</th><th>Título</th><th>Sinopsis</th><th>Fecha de publicación</th><th>Opciones</th><th>
                    <button type="submit" class="btn btn-light border-warning font-weight-bold"><a href="index.jsp">Ir a Inicio</a></button>
                    </th></tr>
                <form method="get" action="grabalibroS.jsp">
                    <tr><td><input type="" required name="isbn" oninvalid="this.setCustomValidity('Por favor, introduzca el ISBN')" 
                                   oninput="setCustomValidity('')" size="13"></td>
                        <td><input type="text" required name="autor" oninvalid="this.setCustomValidity('Por favor, introduzca el autor')" 
                                   oninput="setCustomValidity('')" size="15"></td>
                        <td><input type="text" required name="titulo" oninvalid="this.setCustomValidity('Por favor, introduzca el título')" 
                                   oninput="setCustomValidity('')" size="25"></td>
                        <td><input type="longtext" required name="sinopsis" oninvalid="this.setCustomValidity('Por favor, introduzca la sinopsis')" 
                                   oninput="setCustomValidity('')" size="80"></td>
                        <td><input type="int" required name="fecha" oninvalid="this.setCustomValidity('Por favor, introduzca la fecha')" 
                                   oninput="setCustomValidity('')" size="6"></td>
                        <td><input type="submit" value="⛃ Grabar libro" class="btn btn-primary"></td></tr>
                </form>

                <%--  Listado de los libros existentes en la BBDD con formateo en tabla  --%>

                <%  while (listado.next()) {
                        out.println("<tr><td>");
                        out.println(listado.getString("isbn") + "</td>");
                        out.println("<td>" + listado.getString("autor") + "</td>");
                        out.println("<td>" + listado.getString("titulo") + "</td>");
                        out.println("<td>" + listado.getString("sinopsis") + "</td>");
                        out.println("<td>" + listado.getString("fecha") + "</td>");

                %>
                
                <%--  Añadimos botón al final para la opción de modificar cada libro  --%>
                
                <td>
                    <form method="get" action="editalibroS.jsp">
                        <input type="hidden" name="isbn" value="<%=listado.getString("isbn")%>">
                        <input type="hidden" name="autor" value="<%=listado.getString("autor")%>">
                        <input type="hidden" name="titulo" value="<%=listado.getString("titulo")%>">
                        <input type="hidden" name="sinopsis" value="<%=listado.getString("sinopsis")%>">
                        <input type="hidden" name="fecha" value="<%=listado.getString("fecha")%>">
                        <input type="submit" value="✎Modificar" class="btn btn-info"> 
                    </form>
                </td>
                
                <%-- Añadimos botón al final para la opción de eliminar un libro determinado  --%>
                
                <td>
                    <form method="get" action="borralibroS.jsp">
                        <input type="hidden" name="isbn" value="<%=listado.getString("isbn")%>"/>
                        <input type="submit" value="✖Eliminar" class="btn btn-danger">
                    </form>
                </td></tr>
            
            <%--  Terminamos la conexión a la BBDD cerrando el bucle While  --%>
            
            <%} conexion.close();%>

        </div>

        </body>
</html>
