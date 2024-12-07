<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="entities.User,java.util.List,tools.Tools"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <title>Legion | User List</title>
	<link rel="icon" type="image/icon" href="./images/legionLogoB.ico" media="(prefers-color-scheme: light)">
	<link rel="icon" type="image/icon" href="./images/legionLogo.ico" media="(prefers-color-scheme: dark)">		
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
		<!--     Bootstrap js -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- 	Style CSS -->
	<link rel="stylesheet" href="./css/style.css">
	<!-- CSS de DataTables -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- DataTables -->
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
</head>
<body>
<!-- DIV GENERAL -->
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


<!-- LISTADO -->
    <form id="createUser" action="/Legion/UserServlet" method="get">
        <div class="container-white overflow-x-auto">
            <div class="container" align="center">
                <div class="row">
                    <div class="col">
                        <table id="miTabla" class="table table-bordered table-hover overflow-x-auto">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Rol</th>
                                    <th>DNI</th>
                                    <th>Correo</th>
                                    <th>Telefono</th>
                                    <th>Genero</th>
                                    <th>Nacimiento</th>
                                    <th>Eliminar</th>
                                    <th>Modificar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% List<User> userList = (List<User>) request.getAttribute("userList");
                                for (User user : userList) { %>
                                <tr>
                                    <td><%=user.getName()%></td>
                                    <td><%=user.getLastName()%></td>
                                    <td><%=user.getRole()%></td>
                                    <td><%=user.getDni()%></td>
                                    <td><%=user.getMail()%></td>
                                    <td><%=user.getPhone()%></td>
                                    <td><%=user.getGender()%></td>
                                     <td><%=Tools.convertDateToStringList(user.getBirth())%></td>
                                    <td><button type="submit" name="delete" class="btn btn-danger mt-1" value="<%=user.getId()%>" formaction="/Legion/UserServlet" formmethod="get">Eliminar</button></td>
                                    <td><button type="submit" name="modify" class="btn btn-primary mt-1" value="<%=user.getDni()%>" formaction="/Legion/UserServlet" formmethod="get">Modificar</button></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer mx-auto">
            <img src="./images/logo.png" alt="Logo" class="logoCharlie"> © CharlieDevBadger
        </div>
    </form>
</div>
<!-- JQUERY PARA ORGANIZAR LA TABLA -->
<script>
$(document).ready( function () {
    $('#miTabla').DataTable({
    	"language": {
            url: '//cdn.datatables.net/plug-ins/2.0.1/i18n/es-ES.json',
        },
        "columnDefs": [
            { "orderable": false, "targets": [6, 7] }
        ]
    });
});
</script>
</body>
</html>