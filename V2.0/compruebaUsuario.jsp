
<%@page import="bookscrud.ConexionBBDD"%>
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Statement s = ConexionBBDD.conecta();
            request.setCharacterEncoding("UTF-8");
        %>
        <%
            //Recogemos los valores del formulario de Login
            String usuario = request.getParameter("usuario");
            String contrasena = request.getParameter("contrasena");

            //Comprobamos si el usuario introducido existe en la BBDD
            String compruebaUsuario = "SELECT COUNT(*) AS num FROM usuarios WHERE usuario='" + usuario + "'";
            ResultSet comprueba = s.executeQuery(compruebaUsuario);
            comprueba.next();
            out.print(compruebaUsuario);

            int numero = Integer.parseInt(comprueba.getString("num"));
            out.print(numero);

            if (numero == 0) {
                session.setAttribute("mensaje", "noUser");
                response.sendRedirect("login.jsp");
            } else {
                //Comprobamos si el usuario está validado en la BBDD
                String compruebaValid = "SELECT verificado FROM usuarios WHERE usuario='" + usuario + "'";
                ResultSet valid = s.executeQuery(compruebaValid);
                valid.next();
                int numValid = Integer.parseInt(valid.getString("verificado"));
                if (numValid == 0) {
                    session.setAttribute("mensaje", "noValid");
                    response.sendRedirect("login.jsp");

                } else {

                    //Verificamos que el usuario y contraseña coincidan y vemos que tipo de usuario es
                    String busqueda = "SELECT * FROM usuarios WHERE usuario='" + usuario + "'";
                    ResultSet lista = s.executeQuery(busqueda);
                    lista.next();
                    String tipo = "" + lista.getString("Tipo") + "";
                    String user = "" + lista.getString("Usuario") + "";
                    String pass = "" + lista.getString("Clave") + "";
                    String verificado = "" + lista.getString("Verificado") + "";

                    // Instancia de la clase MessageDigest para métodos de encriptación.
                    MessageDigest md = MessageDigest.getInstance("MD5");
                    // Actualiza la instancia con la cadena que queremos encriptar
                    md.update(contrasena.getBytes());
                    // Crea el hash que comprobaremos con el existente en la BBDD
                    String hash = DatatypeConverter.printHexBinary(md.digest());

                    if (usuario.equals(user) && hash.equals(pass) && verificado.equals("1")) {
                        session.setAttribute("usuario", usuario);
                        session.setAttribute("mensaje", "valid");

                        if (tipo.equals("normal")) {
                            session.setAttribute("sesion", tipo);
                            response.sendRedirect("perfil.jsp");
                        } else {
                            session.setAttribute("sesion", tipo);
                            response.sendRedirect("admin.jsp");
                        }
                    } else {
                        session.setAttribute("mensaje", "novalidP");
                        response.sendRedirect("login.jsp");

                    }
                }
            } 
        %>
    </body>
</html>
