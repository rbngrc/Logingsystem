<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
    <head>
        <%@include file="./Web Resources/header.jsp" %>
    </head>
    <body>
        <main class="fadeIn fast">
            <div class="background">
                <div class="text">
                    <h1>Registro</h1>
                    <p>¿Ya tienes cuenta? <a href="index.jsp">Login</a></p>
                </div>
                <div class="box">
                    <form action="<%=request.getContextPath()%>/Registro" method="post" class="form">
                    	<p>${error}</p>
                        <input type="text" class="username" name="user" placeholder="Usuario" required>
                        <input type="password" class="password" name="pass" placeholder="Contraseña" required>
                        <input type="password" class="password" name="pass2" placeholder="Repite la contraseña" required>
                        <input type="submit" class="button" value="Registrarme">
                    </form>
                </div>
            </div>
        </main>
        <footer>
            <%@include file="./Web Resources/footer.jsp" %>
        </footer>
    </body>
</html>