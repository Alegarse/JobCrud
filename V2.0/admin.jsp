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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="favicon.ico" rel="shortcut icon">
        <title>BooksCRUD</title>
    </head>
    <body>
        <!--  Para impedir que un usuario diferente a admin acceda esta web  -->
        <%
            if (!session.getAttribute("sesion").equals("admin")) {
                response.sendRedirect("index.jsp");
            }
        %>

        <!--  Posibilitar uso de conexión del JSP a BBDD  -->
        <%
            Statement s = ConexionBBDD.conecta();
            request.setCharacterEncoding("UTF-8");
        %> 

        <!--  Jumbotron BootStrap de presentación de la Web del CRUD  -->
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

            <!--  Cabecera para la posibilidad de introducir los datos de un nuevo libro  -->
            <table class="table table-striped text-center table-success">
                <h1 class="display-5 text-center">Incorporar nuevo libro a la biblioteca</h1>
                <tr><th>ISBN</th><th>Autor</th><th>Título</th><th>Sinopsis</th><th>Fecha</th><th>Opciones</th><th>
                    </th></tr>
                <form method="post" action="grabalibro.jsp">
                    <tr><td><input type="int" class="form-control border border-secondary" placeholder="ISBN numérico" required name="isbn" oninvalid="this.setCustomValidity('Por favor, introduzca el ISBN')" 
                                   oninput="setCustomValidity('')" size="13"></td>
                        <td><input type="text" class="form-control border border-secondary" placeholder="Autor" required name="autor" oninvalid="this.setCustomValidity('Por favor, introduzca el autor')" 
                                   oninput="setCustomValidity('')" size="15"></td>
                        <td><input type="text" class="form-control border border-secondary" placeholder="Título" required name="titulo" oninvalid="this.setCustomValidity('Por favor, introduzca el título')" 
                                   oninput="setCustomValidity('')" size="25"></td>
                        <td><input type="longtext" class="form-control border border-secondary" placeholder="Sinópsis del libro" required name="sinopsis" oninvalid="this.setCustomValidity('Por favor, introduzca la sinopsis')" 
                                   oninput="setCustomValidity('')" size="80"></td>
                        <td><input type="int" class="form-control border border-secondary" placeholder="Fecha YYYY" onclick="validarFormulario()" required name="fecha" oninvalid="this.setCustomValidity('Por favor, introduzca la fecha')" 
                                   oninput="setCustomValidity('')" size="6"></td>
                        <td><input type="submit" value="⛃ Grabar libro" class="btn btn-primary"></td></tr>
                </form>
            </table>
        </div>
        <div class="container-fluid">

            <!--  Cargamos los datos de usuarios de la BBDD a un listado  -->
            <%  ResultSet usuarios = s.executeQuery("SELECT * FROM usuarios ORDER BY usuario");%>
            <div class="row">
                <div class="col-6">
                    <table class="table table-hover text-center">
                        <h1 class="display-5 text-center">Listado de usuarios</h1>
                        <tr><th>Tipo</th><th>Usuario</th><th>Activo</th><th>Nombre y apellidos</th><th>Validar usuario</th><th>Eliminar usuario</th><th>Convertir admin</th></tr>

                        <!--  Listado de los usuarios existentes en la BBDD con formateo en tabla  -->
                        <%  while (usuarios.next()) {
                                out.println("<tr><td>");
                                out.println(usuarios.getString("tipo") + "</td>");
                                out.println("<td>" + usuarios.getString("usuario") + "</td>");
                                out.println("<td>" + usuarios.getString("verificado") + "</td>");
                                out.println("<td>" + usuarios.getString("nombre") + "</td>");

                        %>
                        <td>
                            <form method="post" action="validaUsuario.jsp">
                                <input type="hidden" name="usuario" value="<%=usuarios.getString("usuario")%>">
                                <input type="submit" value="✔" class="btn btn-info"> 
                            </form>
                        </td>
                        <td>
                            <form method="post" action="eliminaUsuario.jsp">
                                <input type="hidden" name="usuario" value="<%=usuarios.getString("usuario")%>">
                                <input type="submit" value="✖" class="btn btn-danger"> 
                            </form>
                        </td>
                        <td>
                            <form method="post" action="convertirAdmin.jsp">
                                <input type="hidden" name="usuario" value="<%=usuarios.getString("usuario")%>">
                                <input type="submit" value="⚕" class="btn btn-danger"> 
                            </form>
                        </td>

                        <%}%>
                    </table>
                </div>

                <!--  Cargamos los datos de libros de la BBDD a un listado  -->
                <%  ResultSet libros = s.executeQuery("SELECT * FROM libros ORDER BY isbn DESC");%>
                <div class="col-6">
                    <table class="table table-hover table-white text-center">
                        <h1 class="display-5 text-center">Listado de libros</h1>
                        <tr><th>ISBN</th><th>Autor</th><th>Título</th><th>Editar</th><th>Borrar</th></tr>
                                
                        <%--  Listado de los usuarios existentes en la BBDD con formateo en tabla  --%>
                        <%  while (libros.next()) {
                                out.println("<tr><td>");
                                out.println(libros.getString("ISBN") + "</td>");
                                out.println("<td>" + libros.getString("autor") + "</td>");
                                out.println("<td>" + libros.getString("titulo") + "</td>");
                        %>
                        <!--  Añadimos botón al final para la opción de modificar cada libro  -->
                        <td>
                            <form method="post" action="editalibro.jsp">
                                <input type="hidden" name="isbn" value="<%=libros.getString("isbn")%>">
                                <input type="hidden" name="autor" value="<%=libros.getString("autor")%>">
                                <input type="hidden" name="titulo" value="<%=libros.getString("titulo")%>">
                                <input type="hidden" name="sinopsis" value="<%=libros.getString("sinopsis")%>">
                                <input type="hidden" name="fecha" value="<%=libros.getString("fecha")%>">
                                <input type="submit" value="✎" class="btn btn-info"> 
                            </form>
                        </td>

                        <!-- Añadimos botón al final para la opción de eliminar un libro determinado  -->
                        <td>
                            <form method="post" action="borralibro.jsp">
                                <input type="hidden" name="isbn" value="<%=libros.getString("isbn")%>"/>
                                <input type="submit" value="✖" class="btn btn-danger">
                            </form>
                        </td></tr>

                        <%}%>
                    </table>
                </div>
            </div>
        </div>

        <!-- Ventanas scripts emergentes para informar de mensajes de estado -->
        <script>
            function alert() {
            <%  if (session.getAttribute("mensaje").equals("valid")) { %>
                swal('Usuario logeado correctamente.', '', 'success');
            <%    }
                if (session.getAttribute("mensaje").equals("regE")) {%>
                swal('El ISBN del libro a introducir ya existe en la BBDD.', '', 'error');
            <%    }
                if (session.getAttribute("mensaje").equals("regOK")) {%>
                swal('Libro guardado correctamente en la BBDD.', '', 'success');
            <%    }
                if (session.getAttribute("mensaje").equals("userD")) {%>
                swal('Usuario eliminado correctamente.', '', 'success');
            <%    }
                if (session.getAttribute("mensaje").equals("userV")) {%>
                swal('Usuario validado correctamente.', '', 'success');
            <%    }
                if (session.getAttribute("mensaje").equals("libroM")) {%>
                swal('Libro modificado correctamente.', '', 'success');
            <%    }
                if (session.getAttribute("mensaje").equals("libroB")) {%>
                swal('Libro borrado correctamente.', '', 'success');
            <%    }
                if (session.getAttribute("mensaje").equals("userAV")) {%>
                swal('El usuario ya ha sido validado anteriormente.', '', 'error');
            <%    }
                if (session.getAttribute("mensaje").equals("userCA")) {%>
                swal('El usuario ha sido convertido a administrador.', '', 'success');
            <%    }
                if (session.getAttribute("mensaje").equals("userAA")) {%>
                swal('El usuario ya es administrdor.', '', 'error');
            <%    }
                session.setAttribute("mensaje", "novalid");%>
            }
        </script>

        <script>
            window.alert();
        </script> 

    </body>
</html>