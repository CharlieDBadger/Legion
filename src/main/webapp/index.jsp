<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="entities.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Legion | Index</title>
	<link rel="icon" type="image/icon" href="./images/legionLogoB.ico" media="(prefers-color-scheme: light)">
	<link rel="icon" type="image/icon" href="./images/legionLogo.ico" media="(prefers-color-scheme: dark)">	
	 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    	<!-- 	Style CSS -->
	<link rel="stylesheet" href="./css/style.css">

</head>
<body>
	<%
	User userLogged = (User) session.getAttribute("userLogged");
	String message = (String) request.getAttribute("message");
	%>
    <div>
    	<div class="container-white mx-auto" align="center">
            <img src="./images/legionLogo.png" alt="Logo" class="logoLegion">
        </div>
        <div id="container" class="container-white text-center mx-auto d-flex flex-column">
        <% if (userLogged==null){%>
        	<a class="btn btn-primary mb-1" href="./login.jsp">Login</a><%}%>
        <% if (userLogged!=null){%>
            <a class="btn btn-primary mb-1" href="./UserForm.jsp">Alta de Usuario</a>
            <a class="btn btn-primary mb-1" href="/Legion/UserListServlet">Listado de Usuarios</a><%}%>
            <a class="btn btn-primary mb-1" href="#">Fichar</a>
        </div>
        <% if (message!=null){%>
        <div class="container-white" align="center">
            <%=message%>
        </div>
        <%}else if (userLogged!=null){%>
        <div class="container-white" align="center">
            Bienvenido, <%= userLogged.getName()%>
        </div>
        <%}%>
        <div class="footer mx-auto" align="center">
            <img src="./images/logo.png" alt="Logo" class="logoCharlie">
            © CharlieDevBadger
        </div>
    </div>
    	 <!--     Bootstrap js -->
	 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>