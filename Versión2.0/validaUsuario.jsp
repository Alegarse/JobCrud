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
            
            String valida = "UPDATE usuarios SET "
                        + "verificado=1"
                        + " WHERE usuario='" + request.getParameter("usuario") + "';";
                
                s.execute(valida);
                out.println("Usuario validado correctamente!");
                
            //Creamos las tablas para el usuario
            
            //Tabla para los libros favoritos
            String tabla1 = "CREATE TABLE "
                    + request.getParameter("usuario")+ "_Fav ("
                    + "ISBN BIGINT(20) PRIMARY KEY, Autor VARCHAR(40), Titulo VARCHAR(60)); ";
            s.execute(tabla1);
            
            //Tabla para los libros prestados
            String tabla2 = "CREATE TABLE "
                    + request.getParameter("usuario")+ "_Prest ("
                    + "ISBN BIGINT(20) PRIMARY KEY, Autor VARCHAR(40), Titulo VARCHAR(60)); ";
            s.execute(tabla2);

            response.sendRedirect("admin.jsp");
        %>
    </body>
</html>