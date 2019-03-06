<%-- 
    Document   : borralibro
    Created on : Mar 5, 2019, 1:26:36 PM
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
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookscrud","root", "");
      Statement s = conexion.createStatement();
      
      // Ejecutamos la orden de borrado según comandos SQL
      
      s.execute ("DELETE FROM leidos WHERE isbn=" + request.getParameter("isbn"));
      out.println("Libro borrado correctamente!");
      
      s.close();
    %>	
    
    <%-- Vuelvo a la página principal trás la modificación --%>
    <script>document.location = "leidos.jsp"</script>
  </body>
</html>
