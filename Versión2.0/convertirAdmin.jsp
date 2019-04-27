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

            ResultSet listado = s.executeQuery("SELECT tipo FROM usuarios WHERE usuario='" + request.getParameter("usuario") + "'");
            listado.next();
            String verif = listado.getString("tipo");

            if (verif.equals("normal")) {

                String valida = "UPDATE usuarios SET "
                        + "tipo='admin'"
                        + " WHERE usuario='" + request.getParameter("usuario") + "';";
                session.setAttribute("mensaje", "userCA");
                s.execute(valida);
                response.sendRedirect("admin.jsp");

            } else {
                session.setAttribute("mensaje", "userAA");
                response.sendRedirect("admin.jsp");
            }
             %>
    </body>
</html>