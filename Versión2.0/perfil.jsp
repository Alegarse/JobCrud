
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil de usuario</title>
    </head>
    <body>
        <%
        if (!session.getAttribute("sesion").equals("normal")){
            response.sendRedirect("index.jsp");
        }%>
        <h1>Perfil de usuario</h1>

        <%
            if (session.getAttribute("usuario") != null) {
        %>   
        <h2>Datos del perfil de usuario que está logueado</h2>
        <p> Usuario: <%= session.getAttribute("usuario")%></p>
        <%
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
        <p>Vuelva a la página <a href="index.jsp">principal</a></p>
    </body>
</html>
