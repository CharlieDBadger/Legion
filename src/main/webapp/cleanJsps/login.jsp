<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Legion Login</title>
<link rel="icon" type="image/icon" href="/images/legionLogo.ico" />
</head>
<body>

<div class="header" align="center">
<h1>Legion</h1>
</div>

<div align="center"> 
	<form action="/StockManagerWebProject/LoginServlet" method="post">
		<h2>Inicio de Sesión</h2>
		<label>Usuario</label>
		<br> 
		<input type="text" name="userName" placeholder="Introduzca su Usuario"> 
		<br> 
		<label>Contraseña</label> 
		<br>
		<input type="password" name="userPassword" placeholder="Introduce tu contraseña"> 
		<br> 
		<label for="rememberMe">Recordarme</label> 
		<input type="checkbox" id="rememberMe"> 
		<br>
		<button type="submit">Iniciar Sesión</button>
	</form>
</div>
<div class="footer" align="center">Designed and Coded by CharlieDevBadger</div>
</body>
</html>