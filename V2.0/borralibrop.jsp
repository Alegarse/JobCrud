<%-- 
    Document   : borralibro
    Created on : Mar 5, 2019, 1:26:36 PM
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
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");

            Statement s = ConexionBBDD.conecta();
            // Ejecutamos la orden de borrado según comandos SQL
            s.execute("DELETE FROM " + (String) session.getAttribute("usuario") + "_prest WHERE isbn=" + request.getParameter("isbn"));
            session.setAttribute("mensaje", "libroBP");

        %>	

        <!-- Vuelvo a la página del perfil trás la eliminación -->
        <script>document.location = "perfil.jsp"</script>
    </body>
</html>
