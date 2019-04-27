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

            ResultSet users = s.executeQuery("SELECT verificado FROM usuarios WHERE usuario='" + request.getParameter("usuario") + "'");
            users.next();
            String valid = users.getString("verificado");

            if (valid.equals("0")) {

                String borra = "DELETE FROM usuarios "
                        + "WHERE usuario='" + request.getParameter("usuario") + "';";
                session.setAttribute("mensaje", "userD");
                s.execute(borra);
                response.sendRedirect("admin.jsp");
            }

            if (valid.equals("1")) {

                String borra = "DELETE FROM usuarios "
                        + "WHERE usuario='" + request.getParameter("usuario") + "';";
                session.setAttribute("mensaje", "userD");
                s.execute(borra);

                //Eliminamos tambien sus tablas
                String borra1 = "DROP TABLE " + request.getParameter("usuario") + "_Fav";
                String borra2 = "DROP TABLE " + request.getParameter("usuario") + "_Prest";
                s.execute(borra1);
                s.execute(borra2);
                session.setAttribute("mensaje", "userD");

                response.sendRedirect("admin.jsp");

            }
        %>
    </body>
</html>