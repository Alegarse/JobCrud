<%-- 
    Document   : mueveaL
    Created on : Mar 7, 2019, 1:26:56 PM
    Author     : a.a.garcia.serrano
--%>

<%@page import="bookscrud.ConexionBBDD"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Statement s = ConexionBBDD.conecta();
            request.setCharacterEncoding("UTF-8");

            // Ejecutamos la orden para mover a Leidos verificando que no esté allí ya según comandos SQL
            String existeLibro = "SELECT * FROM " + (String) session.getAttribute("usuario") + "_prest WHERE isbn=" + request.getParameter("isbn");
            ResultSet numLibro = s.executeQuery(existeLibro);
            numLibro.last();

            if (numLibro.getRow() != 0) { //Al contener fila indicaría que ya está en la BBDD
                session.setAttribute("mensaje", "libroEP");
            } else {
                String grabacion = "INSERT INTO " + (String) session.getAttribute("usuario") + "_prest (isbn, autor, titulo) ";
                grabacion += "VALUES ('";
                grabacion += request.getParameter("isbn") + "', '";
                grabacion += request.getParameter("autor") + "', '";
                grabacion += request.getParameter("titulo") + "')";
                session.setAttribute("mensaje", "libroP");

                s.execute(grabacion);
                out.println("Libro grabado correctamente!");
                // Ejecutamos la orden de borrado según comandos SQL
                s.execute("DELETE FROM " + (String) session.getAttribute("usuario") + "_fav WHERE isbn=" + request.getParameter("isbn"));
                out.println("Libro borrado correctamente!");
            }

        %>

        <!-- Vuelvo a la página principal trás la modificación -->
        <script>document.location = "perfil.jsp"</script>
    </body>
</html>
