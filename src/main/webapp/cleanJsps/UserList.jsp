<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="entities.User,java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <title>Legion | User List</title>
	<link rel="icon" type="image/icon" href="./images/legionLogo.ico" />
</head>
<body>
	<form id="createUser" action="/Legion/UserServlet" method="get">
	<table>
		<thead>
			<tr>
				<th>Borrar</th>
				<th>Modificar</th>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>DNI</th>
				<th>Rol</th>
				<th>Mail</th>
				<th>Telefono</th>
				<th>Genero</th>
				<th>Fecha de nacimiento</th>
			</tr>
		</thead>
		<%
		List<User> userList = (List<User>) request.getAttribute("userList");
		for (User user : userList) {
		%>
		<tbody>
			<tr>
				<td><button name="delete" type="submit" value="<%=user.getId()%>">Borrar</button></td>
				<td><button name="modify" type="submit" value="<%=user.getDni()%>">Modificar</button></td>
				<td><%=user.getName()%></td>
				<td><%=user.getLastName()%></td>
				<td><%=user.getDni()%></td>
				<td><%=user.getRole()%></td>
				<td><%=user.getMail()%></td>
				<td><%=user.getPhone()%></td>
				<td><%=user.getGender()%></td>
				<td><%=user.getBirth()%></td>
			</tr>
			<!-- Puedes agregar más filas de datos aquí -->
		</tbody>
	</table>
	<%
	}
	%>
	</form>
</body>
</html>