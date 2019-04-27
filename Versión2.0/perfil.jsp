
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
        <%
            if (!session.getAttribute("sesion").equals("normal")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <!--  Posibilitar uso de conexión del JSP a BBDD  -->

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookscrud", "root", "");
            Statement s = conexion.createStatement();
            request.setCharacterEncoding("UTF-8");
        %> 

        <!--  Jumbotron BootStrap de presentación de la Web del CRUD  -->
        <div class="container-fluid">
            <div class="jumbotron jumbotron text-dark bg-warning">
                <div class="container">
                    <h1 class="display-4">Books Crud - Página de Usuario</h1>
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
            <!--  Cargamos los datos de usuarios de la BBDD a un listado  -->
            <%  ResultSet favoritos = s.executeQuery("SELECT * FROM " + session.getAttribute("usuario") + "_fav");%>
            <div class="row">
                <div class="col-6">
                    <div class="row">
                        <div class="col">
                            <table class="table table-hover text-center">
                                <h1 class="display-5 text-center">Libros marcados favoritos</h1>
                                <tr><th>ISBN</th><th>Autor</th><th>Titulo</th><th>Pasar a prestado</th><th>Ya no me gusta</th></tr>
                                <!--  Listado de los usuarios existentes en la BBDD con formateo en tabla  -->

                                <%  while (favoritos.next()) {
                                        out.println("<tr><td>");
                                        out.println(favoritos.getString("ISBN") + "</td>");
                                        out.println("<td>" + favoritos.getString("autor") + "</td>");
                                        out.println("<td>" + favoritos.getString("titulo") + "</td>");
                                %>
                                <td>
                                    <form method="get" action="favapres.jsp">
                                        <input type="hidden" name="isbn" value="<%=favoritos.getString("isbn")%>">
                                        <input type="hidden" name="autor" value="<%=favoritos.getString("autor")%>">
                                        <input type="hidden" name="titulo" value="<%=favoritos.getString("titulo")%>">
                                        <input type="submit" value="⇊" class="btn btn-success text-warning border-primary"> 
                                    </form>
                                </td>
                                <td>
                                    <form method="get" action="borralibrofav.jsp">
                                        <input type="hidden" name="isbn" value="<%=favoritos.getString("isbn")%>">
                                        <input type="submit" value="✖" class="btn btn-success text-warning border-danger"> 
                                    </form>
                                </td></tr>

                                <%}%>
                            </table>
                        </div>
                        <div class="w-100"></div>
                        <div class="col">
                            <!--  Cargamos los datos de usuarios de la BBDD a un listado  -->
                            <%  ResultSet prestados = s.executeQuery("SELECT * FROM " + session.getAttribute("usuario") + "_prest");%>
                            <table class="table table-hover text-center">
                                <h1 class="display-5 text-center">Libros en préstamo</h1>
                                <tr><th>ISBN</th><th>Autor</th><th>Titulo</th><th>Devolver</th></tr>
                                        <%--  Listado de los usuarios existentes en la BBDD con formateo en tabla  --%>

                                <%  while (prestados.next()) {
                                        out.println("<tr><td>");
                                        out.println(prestados.getString("ISBN") + "</td>");
                                        out.println("<td>" + prestados.getString("autor") + "</td>");
                                        out.println("<td>" + prestados.getString("titulo") + "</td>");
                                %>
                                <td>
                                    <form method="get" action="borralibrop.jsp">
                                        <input type="hidden" name="isbn" value="<%=prestados.getString("ISBN")%>">
                                        <input type="submit" value="✖" class="btn btn-danger"> 
                                    </form>
                                </td>

                                <%}%>
                            </table>
                        </div>
                    </div>
                </div>




                <!--  Cargamos los datos de usuarios de la BBDD a un listado  -->
                <%  ResultSet libros = s.executeQuery("SELECT * FROM libros ORDER BY fecha DESC");%>
                <div class="col-6">
                    <table class="table table-hover table-dark">
                        <h1 class="display-5 text-center">Listado de libros disponibles</h1>
                        <tr><th>ISBN</th><th>Autor</th><th>Título</th><th>Fecha</th><th>Marcar</th></tr>
                                <%--  Listado de los usuarios existentes en la BBDD con formateo en tabla  --%>

                        <%  while (libros.next()) {
                                out.println("<tr><td>");
                                out.println(libros.getString("ISBN") + "</td>");
                                out.println("<td>" + libros.getString("autor") + "</td>");
                                out.println("<td>" + libros.getString("titulo") + "</td>");
                                out.println("<td>" + libros.getString("fecha") + "</td>");
                        %>
                        <td><form method="get" action="favlibro.jsp">
                                <input type="hidden" name="isbn" value="<%=libros.getString("isbn")%>">
                                <input type="hidden" name="autor" value="<%=libros.getString("autor")%>">
                                <input type="hidden" name="titulo" value="<%=libros.getString("titulo")%>">
                                <input type="submit" value="★" class="btn btn-info text-warning"> 
                            </form>
                        </td></tr>

                        <%}
                            conexion.close();%>
                    </table>
                </div>
            </div>

            <!-- Ventana emergente para informar de logeo correcto si corresponde-->
            <% if (session.getAttribute("mensaje").equals("valid")) { %>
            <script>
                window.alert("Usuario logeado correctamente");
            </script> 
            <% session.setAttribute("mensaje", "novalid");
            }
            if (session.getAttribute("mensaje").equals("libroP")) { %>
            <script>
                window.alert("Libro pasado a lista de prestados correctamente.", "height=200,width=700,titlebar=no,left=300,top=300");
            </script> 
            <% session.setAttribute("mensaje", "novalid");
            }
            if (session.getAttribute("mensaje").equals("libroF")) { %>
            <script>
                window.alert("Libro pasado a lista de favoritos correctamente.", "height=200,width=700,titlebar=no,left=300,top=300");
            </script> 
            <% session.setAttribute("mensaje", "novalid");
            }
            if (session.getAttribute("mensaje").equals("libroNMG")) { %>
            <script>
                window.alert("Libro eliminado de mi lista correctamente.", "height=200,width=700,titlebar=no,left=300,top=300");
            </script> 
            <% session.setAttribute("mensaje", "novalid");
            }
            if (session.getAttribute("mensaje").equals("libroBP")) { %>
            <script>
                window.alert("Libro devuelto correctamente.", "height=200,width=700,titlebar=no,left=300,top=300");
            </script> 
            <% session.setAttribute("mensaje", "novalid");
            }
            if (session.getAttribute("mensaje").equals("libroEP")) { %>
            <script>
                window.alert("Error. Ya tiene ese libro en préstamo.", "height=200,width=700,titlebar=no,left=300,top=300");
            </script> 
            <% session.setAttribute("mensaje", "novalid");
            }%>


    </body>
</html>
