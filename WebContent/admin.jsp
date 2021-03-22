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
                <% String mensaje = (String) request.getSession().getAttribute("user"); %>
                	<h1><%=mensaje %></h1>
                	<p>¿Desea cerrar la sesión? <a href="<%=request.getContextPath()%>/CerrarSesion">Cerrar sesión</a></p>
                </div>
                <div class="box">
                    <table class="form">
                        <tr>
                        	<th></th>
                            <th>Usuario</th>
                            <th>Contraseña</th>
                        </tr>

                        <% 
                        ArrayList<Usuario> lista_usuarios = (ArrayList<Usuario>) request.getAttribute("listado");
                        if(lista_usuarios != null){
                            for(int i=0; i<lista_usuarios.size(); i++){ 
                        %>

                        <tr>
                        	<form action="<%=request.getContextPath()%>/Eliminar" method="post" class="form">
                        		<td><input type="hidden" name="id" value=<%= i %> required></td>
                            	<td><input type="text" class="username" value=<%= lista_usuarios.get(i).getUser() %> readonly="readonly"></td>
                            	<td><input type="text" class="username" value=<%= lista_usuarios.get(i).getPass() %> readonly="readonly"></td>
                            	<td><input type="submit" class="button" value="Eliminar"></td>
                           	</form>
                        </tr>
                        
                        <tr>
                        	<form action="<%=request.getContextPath()%>/Modificar" method="post" class="form">
                        		<td><input type="hidden" name="id" value=<%= i %> required></td>
                            	<td><input type="text" name="user" class="username" placeholder=<%= lista_usuarios.get(i).getUser() %> required></td>
                            	<td><input type="text" name="pass" class="username" placeholder=<%= lista_usuarios.get(i).getPass() %> required></td>
                            	<td><input type="submit" class="button" value="Modificar"></td>
                           	</form>
                        </tr>

                        <%	
                            }
                        }
                        %>

                    </table>
                </div>
            </div>
        </main>
        <footer>
            <%@include file="./Web Resources/footer.jsp" %>
        </footer>
    </body>
</html>