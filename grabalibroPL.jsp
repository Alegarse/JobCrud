<%-- 
    Document   : grabalibro
    Created on : Mar 5, 2019, 12:08:09 PM
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
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookscrud", "root", "");
            Statement s = conexion.createStatement();
            request.setCharacterEncoding("UTF-8");

            // Vemos si el libro a introducir ya existe comprobando su ISBN
            String existeLibro = "SELECT * FROM porleer WHERE isbn=" + request.getParameter("isbn");
            ResultSet numLibro = s.executeQuery(existeLibro);
            numLibro.last();

            if (numLibro.getRow() != 0) { //Al contener fila indicaría que ya está en la BBDD
                out.println("Error, ya existe el ISBN" + request.getParameter("isbn"));
            } else {
                String grabacion = "INSERT INTO porleer (isbn, autor, titulo, sinopsis, fecha) ";
                grabacion += "VALUES ('";
                grabacion += request.getParameter("isbn") + "', '";
                grabacion += request.getParameter("autor") + "', '";
                grabacion += request.getParameter("titulo") + "', '";
                grabacion += request.getParameter("sinopsis") + "', '";
                grabacion += Integer.parseInt(request.getParameter("fecha")) + "')";

                s.execute(grabacion);
                out.println("Libro grabado correctamente!");
            }
            conexion.close();

        %>

        <script>
            // Volvemos al index
            location.replace("porleer.jsp");
        </script>
    </body>
</html>
