
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
        <link rel="stylesheet" href="miestilo.css">

        <title>Página de administracion </title>
    </head>
    <body>
        <%
            if (!session.getAttribute("sesion").equals("admin")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <%--  Posibilitar uso de conexión del JSP a BBDD  --%>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookscrud", "root", "");
            Statement s = conexion.createStatement();
            request.setCharacterEncoding("UTF-8");
        %> 

        <%--  Jumbotron BootStrap de presentación de la Web del CRUD  --%>
        <div class="container-fluid">
            <div class="jumbotron jumbotron text-dark bg-warning">
                <div class="container">
                    <h1 class="display-4">Books Crud - Página de administrador</h1>
                    <p class="lead">Tu gestión de libros con unos pocos clics!</p>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="logeo">
                <div class="card text-center">
                    <ul class="nav nav-pills justify-content-end mb-1 mt-1 mr-1">
                        <%
                            if (session.getAttribute("usuario") != null) {
                        %>
                        <li class="nav-item">
                            <a class="nav-link mr-1" href="#">
                                <%
                                    String usr = (String) session.getAttribute("usuario");
                                    usr = Character.toUpperCase(usr.charAt(0)) + usr.substring(1, usr.length());
                                    out.print("Usuario: " + usr);
                                %>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn btn-light border-warning font-weight-bold mr-1" href="index.jsp">Ir a Inicio ♻</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn btn-outline-danger" href="logout.jsp">Cerrar sesión ✕</a>
                        </li>

                        <%
                            }
                        %>

                    </ul>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <%--  Cargamos los datos de usuarios de la BBDD a un listado  --%>
            <%  ResultSet usuarios = s.executeQuery("SELECT * FROM usuarios");%>
            <div class="row">
                <div class="col-6">
                    <table class="table table-hover text-center">
                        <h1 class="display-5 text-center">Listado de usuarios</h1>
                        <tr><th>Tipo</th><th>Usuario</th><th>Clave</th><th>Activo</th><th>Nombre y apellidos</th><th>Validar usuario</th><th>Eliminar usuario</th></tr>
                                <%--  Listado de los usuarios existentes en la BBDD con formateo en tabla  --%>

                        <%  while (usuarios.next()) {
                                out.println("<tr><td>");
                                out.println(usuarios.getString("tipo") + "</td>");
                                out.println("<td>" + usuarios.getString("usuario") + "</td>");
                                out.println("<td>" + usuarios.getString("clave") + "</td>");
                                out.println("<td>" + usuarios.getString("verificado") + "</td>");
                                out.println("<td>" + usuarios.getString("nombre") + "</td>");

                        %>
                        <td>
                            <form method="get" action="validaUsuario.jsp">
                                <input type="hidden" name="usuario" value="<%=usuarios.getString("usuario")%>">
                                <input type="submit" value="✔" class="btn btn-info"> 
                            </form>
                        </td>
                        <td>
                            <form method="get" action="eliminaUsuario.jsp">
                                <input type="hidden" name="usuario" value="<%=usuarios.getString("usuario")%>">
                                <input type="submit" value="✕" class="btn btn-danger"> 
                            </form>
                        </td>

                        <%}%>
                    </table>
                </div>

                <%--  Cargamos los datos de usuarios de la BBDD a un listado  --%>
                <%  ResultSet libros = s.executeQuery("SELECT * FROM libros ORDER BY fecha DESC");%>
                <div class="col-6">
                    <table class="table table-hover table-dark text-center">
                        <h1 class="display-5 text-center">Listado de libros</h1>
                        <tr><th>ISBN</th><th>Autor</th><th>Título</th><th>Fecha</th></tr>
                                <%--  Listado de los usuarios existentes en la BBDD con formateo en tabla  --%>

                        <%  while (libros.next()) {
                                out.println("<tr><td>");
                                out.println(libros.getString("ISBN") + "</td>");
                                out.println("<td>" + libros.getString("autor") + "</td>");
                                out.println("<td>" + libros.getString("titulo") + "</td>");
                                out.println("<td>" + libros.getString("fecha") + "</td>");
                        %>


                        <%}
                            conexion.close();%>
                    </table>
                </div>
            </div>
        </div>


    </body>
</html>
