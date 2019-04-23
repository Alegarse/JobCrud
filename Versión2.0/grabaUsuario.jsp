<%-- 
    Document   : grabaUsuario
    Created on : 23-abr-2019, 10:02:58
    Author     : Alejandro
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

            // Vemos si el usuario a introducir ya existe
            String existeUsuario = "SELECT * FROM usuarios WHERE usuario=" + request.getParameter("usuario");
            ResultSet User = s.executeQuery(existeUsuario);
            User.last();

            if (User.getRow() != 0) { //Al contener fila indicaría que ya está en la BBDD
                out.println("Error, ya existe el usuario" + request.getParameter("usuario"));%>
            <button type="submit" class="btn btn-warning"><a href="index.jsp">Volver a inicio</a></button>
            <%} else {
                String grabacion = "INSERT INTO usuarios (usuario, clave, nombre) VALUES (";
                grabacion += request.getParameter("usuario") + "', '";
                grabacion += request.getParameter("contrasena") + "', '";
                grabacion += request.getParameter("nombre") + "')";

                s.execute(grabacion);
                out.println("Usuario grabado correctamente!");
            }
            conexion.close();%>
        <script>
            // Volvemos al index
            location.replace("leidos.jsp");
        </script>



    </body>
</html>