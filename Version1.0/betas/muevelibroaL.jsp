<%-- 
    Document   : mueveaL
    Created on : Mar 7, 2019, 1:26:56 PM
    Author     : a.a.garcia.serrano
--%>

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
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookscrud", "root", "");
            Statement s = conexion.createStatement();

            // Ejecutamos la orden para mover a Leidos verificando que no esté allí ya según comandos SQL
            String existeLibro = "SELECT * FROM leidos WHERE isbn=" + request.getParameter("isbn");
            ResultSet numLibro = s.executeQuery(existeLibro);
            numLibro.last();

            if (numLibro.getRow() != 0) { //Al contener fila indicaría que ya está en la BBDD
                out.println("Error, ya existe el ISBN" + request.getParameter("isbn"));
            } else {
                String grabacion = "INSERT INTO leidos (isbn, autor, titulo, sinopsis, fecha) ";
                grabacion += "VALUES ('";
                grabacion += request.getParameter("isbn") + "', '";
                grabacion += request.getParameter("autor") + "', '";
                grabacion += request.getParameter("titulo") + "', '";
                grabacion += request.getParameter("sinopsis") + "', '";
                grabacion += Integer.parseInt(request.getParameter("fecha")) + "')";

                s.execute(grabacion);
                out.println("Libro grabado correctamente!");
            }

            // Ejecutamos la orden de borrado según comandos SQL
            s.execute("DELETE FROM porleer WHERE isbn=" + request.getParameter("isbn"));
            out.println("Libro borrado correctamente!");

            s.close();
        %>

        <%-- Vuelvo a la página principal trás la modificación --%>
        <script>document.location = "porleer.jsp"</script>
    </body>
</html>
