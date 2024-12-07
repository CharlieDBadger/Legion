<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Legion | Login</title>
	<link rel="icon" type="image/icon" href="./images/legionLogoB.ico" media="(prefers-color-scheme: light)">
	<link rel="icon" type="image/icon" href="./images/legionLogo.ico" media="(prefers-color-scheme: dark)">		
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- 	Style CSS -->
	<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%
	String message = (String) request.getAttribute("message");
	%>
    <div align="center">
        <div class="container-white mx-auto">
            <form action="/Legion/LoginServlet" method="post">
                <h2 class="mt-3">Bienvenido</h2>
                <hr>
                <div class="form-group mt-4">
                    <input type="text" name="userDni" class="form-control" placeholder="Introduce tu Dni">
                </div>
                <div class="form-group">
                    <input type="password" name="userPassword" class="form-control" placeholder="Introduce tu contraseña">
                </div>
                <button type="submit" class="btn btn-primary mt-1">Iniciar Sesión</button>
                <div class="form-group form-check mt-2">
                    <input type="checkbox" name="terminos" id="rememberMe" class="form-check-input">
                    <label for="rememberMe" class="form-check-label">Recordarme</label>
                </div>
                <div class=" mt-2">
                    <p><%=message!=null ? message : "" %></p>
                </div>
            </form>
        </div>
        <div class="footer mx-auto">
            <img src="./images/logo.png" alt="Logo" class="logoCharlie"> © CharlieDevBadger
        </div>
    </div>
   	<!--     Bootstrap js -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   </body>

</html>