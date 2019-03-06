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

                String modifica = "UPDATE sugeridos SET "
                        + "autor='" + request.getParameter("autor")
                        + "', titulo='" + request.getParameter("titulo")
                        + "', sinopsis='" + request.getParameter("sinopsis")
                        + "', fecha='" + request.getParameter("fecha")
                        + "' WHERE isbn=" + request.getParameter("isbn") + ";";
                
                s.execute(modifica);
                out.println("Libro modificado correctamente!");
                conexion.close();

        %>
        
        <%-- Vuelvo a la página principal trás la modificación --%>
        <script>document.location = "sugeridos.jsp"</script>

    </body>
</html>