<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dam2.dii.p3.Usuario"%>
<!DOCTYPE>
<html>
    <head>
        <%@include file="./Web Resources/header.jsp" %>
    </head>
    <body>
        <main class="fadeIn fast">
            <div class="background">
                <div class="text">
                	<p>Modifique sus datos</p>
                <% String usuarioNombre = (String) request.getSession().getAttribute("user"); 
                String usuarioContrasena = (String) request.getSession().getAttribute("pass");
                %>
                    <h1><%=usuarioNombre %></h1>
                    <p>¿Desea cerrar la sesión? <a href="<%=request.getContextPath()%>/CerrarSesion">Cerrar sesión</a></p>
                </div>
                <div class="box">
                    <form action="<%=request.getContextPath()%>/ModificarHome" class="form">
                    	<p>${error}</p>
                        <input type="text" class="username" value=<%=usuarioNombre %> required>
                        <input type="text" class="password" value=<%=usuarioContrasena %> required>
                        <input type="submit" class="button" value="Guardar cambios">
                    </form>
                </div>
            </div>
        </main>
        <footer>
            <%@include file="./Web Resources/footer.jsp" %>
        </footer>
    </body>
</html>