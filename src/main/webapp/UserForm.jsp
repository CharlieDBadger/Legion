<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="entities.User,tools.Tools"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Legion | User Form</title>
	<link rel="icon" type="image/icon" href="./images/legionLogoB.ico" media="(prefers-color-scheme: light)">
	<link rel="icon" type="image/icon" href="./images/legionLogo.ico" media="(prefers-color-scheme: dark)">		
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<!-- 	Style CSS -->
	<link rel="stylesheet" href="./css/style.css">
</head>
<body>   	
<div class="col-lg-11 col-sm-11 col-xs-11 overflow-x-auto">

<!-- MENÚ -->
<div class="container-wmenu">
    <nav class="navbar navbar-expand-lg navbar-light bg-white  justify-content-center">
        <!-- Logo -->
        <a class="navbar-brand logo-con-margen " href="./index.jsp">
            <img src="./images/logoLegionMenu.png" alt="Legion Logo" width="120" height="auto">
        </a>
        <!-- Botón de colapsar -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Contenido del menú -->
        <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="./UserForm.jsp">Alta Usuario</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/Legion/UserListServlet">Listado Usuarios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Fichar</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Usuario</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Cerrar Sesión</a>
                </li>
            </ul>
        </div>
    </nav>
</div>

<!-- 	FORMULARIO -->
    <% 
    User user = (User) request.getAttribute("userToModify");
    %>
    <form id="createUser" action="/Legion/UserServlet" method="post">
        <div>
            <div class="row container-white">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="name" class="form-label mt-1 mb-1">Nombre:</label><br>
                        <input value="<%= user == null ? "" : user.getName() %>" type="text" id="name" name="name" class="form-control" placeholder="Introduce tu Nombre" required>
                        
                        <label for="lastName" class="form-label mt-1 mb-1">Apellido:</label><br>
                        <input value="<%= user == null ? "" : user.getLastName()%>" type="text" id="lastName" name="lastName" class="form-control" placeholder="Introduce tu Apellido" required>
                        
                        <label for="dni" class="form-label mt-1 mb-1">DNI:</label><br>
                        <input value="<%= user == null ? "" : user.getDni()%>" type="text" id="dni" name="dni" class="form-control" placeholder="Introduce tu DNI" required>
                       
                        <label for="email" class="form-label mt-1 mb-1">Email:</label><br>
                        <input value="<%= user == null ? "" : user.getMail()%>" type="text" id="email" name="email" class="form-control" placeholder="Introduce tu Email" required>
                        
                        <label for="password" class="form-label mt-1 mb-1">Contraseña:</label><br>
                        <input value="<%= user == null ? "" : user.getPassword()%>" type="password" id="password" name="password" class="form-control" placeholder="Introduce tu Contraseña" required>
                        
                        <label for="idUser" class="form-label mt-1 mb-3">ID Usuario:</label><br>
                        <input value ="<%= user == null ? "" : user.getId()%>" type="text" readonly id="idUser" name="idUser" class="form-control" placeholder="ID sin asignar" required>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="telephone" class="form-label mt-1 mb-1">Telefono: </label><br>
                        <input value="<%= user == null ? "" : user.getPhone()%>" type="text" id="telephone" name="telephone" class="form-control" placeholder="Introduce tu Telefono" required>
                    	
                        <label for="role" class="form-label mt-1 mb-1">Rol de Usuario</label><br>
                        <select id="role" name="role" class="form-select mb-1" required>
                            <option value="Usuario" <% if (user == null || !user.getRole().equals("Admin")) { %> selected <% } %>>Usuario</option>
                            <option value="Admin" <% if (user != null && user.getRole().equals("Admin")) { %> selected <% } %>>Administrador</option>
                        </select>
                        <label for="gender" class="form-label">Sexo:</label><br>
                        <input type="radio" id="male" name="gender" value="Masculino" <% if (user != null && user.getGender().equals("Masculino")) { %> checked <% } %> required>
                        <label for="male">Masculino</label><br>
                        <input type="radio" id="female" name="gender" value="Femenino" <% if (user != null && user.getGender().equals("Femenino")) { %> checked <% } %> required>
                        <label for="female">Femenino</label><br>
                        <input type="radio" id="other" name="gender" value="Otro" <% if (user != null && user.getGender().equals("Otro")) { %> checked <% } %> required>
                        <label for="other">Otro</label><br>
                        
                        <label for="birth" class="form-label mt-2 mb-2">Fecha de Nacimiento: </label><br>
                        <% if (user == null){ %>
                        <input type="date" name="birth" class="form-control" id="birth">
                        <% } else if (user != null) { %>
                        <input type="date" name="birth" class="form-control" readonly id="birth" value="<%= Tools.convertDateToString(user.getBirth()) %>">
                        <% } %>
                        <input type="submit" class="btn btn-primary mt-2 mb-1" value="<%= user == null ? "Enviar" : "Actualizar"%>">
                        <% if (user != null ){ %>
                        <br>
                        <button type="submit" name="delete" class="btn btn-danger mt-1" value="<%=user.getId()%>" formaction="/Legion/UserServlet" formmethod="get">Borrar</button>
                        <% } %>
                    </div>
                    
                </div>
                
            </div>
            <div class="footer mx-auto">
            <img src="./images/logo.png" alt="Logo" class="logoCharlie"> © CharlieDevBadger
        </div>
        </div>
    </form>
    </div>
    	<!--     Bootstrap js -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>