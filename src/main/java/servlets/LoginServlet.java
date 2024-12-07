package servlets;

import java.io.IOException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.support.AbstractApplicationContext;

import commands.UserCommand;
import entities.User;
import enums.ContextEnum;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String message;
	AbstractApplicationContext context = ContextEnum.INSTANCE.getContext();
	private static final Logger logger = LogManager.getLogger(User.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String loginName = request.getParameter("userDni");
		String loginPassword = request.getParameter("userPassword");
		
		 UserCommand command = (UserCommand) context.getBean("command");
		 User userCheck = command.getUserLogin(loginName, loginPassword);
		 
		 logger.info(userCheck);
		 
	    if (userCheck != null) {
	    	logger.info("Usuario Encontrado.");
	    	
	        HttpSession session = request.getSession();
	    	
	    	session.setAttribute("userLogged", userCheck);
	    	
	    	RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
	    	
			rd.forward(request, response);
	        
	        

			} else if (userCheck == null){
				logger.info("Usuario NO Encontrado.");
				
				message = "Usuario no encontrado.";
				
				request.setAttribute("message", message);

				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				
				rd.forward(request, response);
			}
		}
	}


