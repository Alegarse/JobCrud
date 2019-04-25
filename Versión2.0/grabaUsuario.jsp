<%-- 
    Document   : grabaUsuario
    Created on : 23-abr-2019, 10:02:58
    Author     : Alejandro
--%>

<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.security.MessageDigest"%>
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

            //Recogemos los valores del formulario de Login
            String usuario = request.getParameter("usuario");
            String contrasena = request.getParameter("contrasena");

            // Vemos si el usuario a introducir ya existe
            String compruebaUsuario = "SELECT COUNT(*) AS num FROM usuarios WHERE usuario='" + usuario + "'";
            ResultSet comprueba = s.executeQuery(compruebaUsuario);
            comprueba.next();

            int numero = Integer.parseInt(comprueba.getString("num"));

            if (numero != 0) { //Al contener fila indicaría que ya está en la BBDD
                response.sendRedirect("User.jsp");
            } else {

                // Instancia de la clase MessageDigest para métodos de encriptación.
                MessageDigest md = MessageDigest.getInstance("MD5");
                // Actualiza la instancia con la cadena que queremos encriptar
                md.update(request.getParameter("contrasena").getBytes());
                // Crea el hash que comprobaremos con el existente en la BBDD
                String hash = DatatypeConverter.printHexBinary(md.digest());

                String grabacion = "INSERT INTO usuarios (usuario, clave, nombre) VALUES ('";
                grabacion += request.getParameter("usuario") + "', '";
                grabacion += hash + "', '";
                grabacion += request.getParameter("nombre") + "')";

                out.print(grabacion);

                s.execute(grabacion);
                out.println("Usuario grabado correctamente!");%>

        <script>
            // Volvemos al index
            location.replace("index.jsp");
        </script>
        <%   }
            conexion.close();

        %>




    </body>
</html>