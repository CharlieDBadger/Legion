package enums;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;

import commands.UserCommand;
import entities.User;

public enum UserListEnum {
	INSTANCE;

	private List<User> userList;

	public List<User> getUserList() {
		
		// Generación de contexto
		AbstractApplicationContext context = ContextEnum.INSTANCE.getContext();
		// Obtener el UserCommand del contexto de Spring
		UserCommand userCommand = (UserCommand)context.getBean("command");
		// Consultar la lista de usuarios
		userList = userCommand.getUserList();
		
		return userList;
	}
}
