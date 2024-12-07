package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;

import org.springframework.context.support.AbstractApplicationContext;

import commands.UserCommand;
import entities.User;
import enums.ContextEnum;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tools.Tools;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AbstractApplicationContext context = ContextEnum.INSTANCE.getContext();
	private String message;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Command
		UserCommand userCommand = (UserCommand) context.getBean("command");

		// Get/Set User
		User searchUser = (User) context.getBean("user");
		
		if (request.getParameter("delete") != null) {

			userCommand.deleteUser(Long.parseLong(request.getParameter("delete")));

			message = "Usuario Eliminado";

			request.setAttribute("message", message);

			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			// Se envia al JSP
			rd.forward(request, response);

		} else if (request.getParameter("modify") != null) {

			searchUser = userCommand.getUserDni(request.getParameter("modify"));

			// Redirección a JSP
			request.setAttribute("userToModify", searchUser);

			RequestDispatcher rd = request.getRequestDispatcher("UserForm.jsp");
			// Se envia al JSP
			rd.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Command
		UserCommand userCommand = (UserCommand) context.getBean("command");

		// Get/Set User
		User user = (User) context.getBean("user");

		String id = request.getParameter("idUser");
		long idLong = 0;
		try {
			idLong = Long.parseLong(id);
		} catch (NumberFormatException e) {
		}

		// Creación de Objeto
		user.setName(request.getParameter("name"));
		user.setLastName(request.getParameter("lastName"));
		user.setDni(request.getParameter("dni"));
		user.setPassword(request.getParameter("password"));
		user.setRole(request.getParameter("role"));
		user.setMail(request.getParameter("email"));
		user.setPhone(request.getParameter("telephone"));
		user.setGender(request.getParameter("gender"));

		// Conversión fechaString -> fechaDate
		String birth = request.getParameter("birth");
		Date dateBirth;
		try {
			dateBirth = Tools.convertStringToDate(birth);
		} catch (ParseException e) {
			dateBirth = null;
			e.printStackTrace();
		}
		user.setBirth(dateBirth);

		// Inserción o actualización a DDBB
		if (idLong == 0) {
			userCommand.saveUser(user);
			message = "Usuario insertado con exito.";
		} else if (idLong != 0) {
			user.setId(idLong);
			userCommand.updateUser(user);
			message = "Usuario actualizado con exito.";
		}
		// Redirección a JSP
		request.setAttribute("message", message);

		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		// Se envia al JSP
		rd.forward(request, response);
	}

}
