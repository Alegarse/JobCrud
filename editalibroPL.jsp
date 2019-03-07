<%-- 
    Document   : modificalibro
    Created on : Mar 5, 2019, 12:48:46 PM
    Author     : a.a.garcia.serrano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%-- Para poder usar BootStrap4  --%>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" 
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" 
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="miestilo.css"


    </head>

    <body>

        <%-- Para que no haya conflicto con caracteres especiales  --%>

        <% request.setCharacterEncoding("UTF-8");%>

        <div class="container" >
            <br><br>
            <div class="panel panel-info">
                <div class="shadow p-3 mb-5 bg-white rounded text-center text-success"><b></b>Modificación de datos del libro</b></div>
                <form method="get" action="modilibroPL.jsp">
                    <div class="form-row">
                        <div class="form-group"> 
                            <label for="input_isbn"><b>ISBN</b> </label>
                            <input type="bigint" class="form-control" name="isbn" value="<%= request.getParameter("isbn")%>" readonly>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label for="input_autor"><b>Autor</b> </label>
                            <input type="text" class="form-control" required name="autor" 
                                   oninvalid="this.setCustomValidity('Por favor, introduzca el autor')" 
                                   oninput="setCustomValidity('')" value="<%= request.getParameter("autor")%>">
                        </div>
                        <div class="form-group col-6">
                            <label for="input_titulo"><b>Título</b> </label>
                            <input type="text" class="form-control" required name="titulo" 
                                   oninvalid="this.setCustomValidity('Por favor, introduzca el título')" 
                                   oninput="setCustomValidity('')" value="<%= request.getParameter("titulo")%>">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-12">
                            <label for="input_sinopsis"><b>Sinopsis</b> </label>
                            <input type="longtext" class="form-control" required name="sinopsis" rows="3" 
                                   oninvalid="this.setCustomValidity('Por favor, introduzca la sinopsis')" 
                                   oninput="setCustomValidity('')" value="<%= request.getParameter("sinopsis")%>">    
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label for="input_fecha"><b>Fecha de publicación (Año)</b> </label>
                            <input type="int" class="form-control" required name="fecha" 
                                   oninvalid="this.setCustomValidity('Por favor, introduzca la fecha')" 
                                   oninput="setCustomValidity('')" value="<%= Integer.parseInt(request.getParameter("fecha"))%>">
                        </div>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-warning"><a href="porleer.jsp">Cancelar Modificacion</a></button>
                    <button type="submit" class="btn btn-success">Aceptar</button><br><br>
                </form>

            </div>
    </body>
</html>