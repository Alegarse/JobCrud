<%-- 
    Document   : grabalibro
    Created on : Mar 5, 2019, 12:08:09 PM
    Author     : a.a.garcia.serrano
--%>
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
    </head>
    <body>
        <%
            Statement s = ConexionBBDD.conecta();
            request.setCharacterEncoding("UTF-8");

            String modifica = "UPDATE libros SET "
                    + "autor='" + request.getParameter("autor")
                    + "', titulo='" + request.getParameter("titulo")
                    + "', sinopsis='" + request.getParameter("sinopsis")
                    + "', fecha='" + request.getParameter("fecha")
                    + "' WHERE isbn=" + request.getParameter("isbn") + ";";
            session.setAttribute("mensaje", "libroM");

            s.execute(modifica);

        %>

        <!-- Vuelvo a la página de admin trás la modificación -->
        <script>document.location = "admin.jsp"</script>

    </body>
</html>