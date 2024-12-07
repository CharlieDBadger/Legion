package main;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;

import commands.UserCommand;
import entities.User;
import enums.ContextEnum;
import enums.UserListEnum;

public class main {

	public static void main(String[] args) {

//		Generación de contexto-Funciona
//		AbstractApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		
//		Context Enum-Funciona
		AbstractApplicationContext context = ContextEnum.INSTANCE.getContext();

//		Creacion Command/Dao-Funciona
		UserCommand command = (UserCommand) context.getBean("command");
		
//		Crear beans-funciona
//		User user = (User) context.getBean("user");
//		user.setName("Juan");
//		user.setPassword("root");
//		user.setDni("123");
//		User user1 = (User) context.getBean("user");
//		user1.setName("Cristian");
//		user1.setPassword("root");
//		user1.setDni("321");
//		User user2 = (User) context.getBean("user");
//		user2.setName("Ramiro");
//		user2.setPassword("root");
//		user2.setDni("007");
//		
////		Guardar-Funciona
//		command.saveUser(user);
//		command.saveUser(user1);
//
////		Buscar Usuario-Funciona
//		User search = command.getUserDni("123");
//		System.out.println("GetUserDni-READ:\n" + search);
//		User search1 = command.getUserId(2);
//		System.out.println("GetUserId-READ:\n" + search1);
//		
//
////		Listado-Funciona.
//		List<User> list = command.getUserList();
//		System.out.println("GetUserList-SELECT: ");
//		for (User users : list) {
//			System.out.println(users);
//		}
//		
////		Borrar-Funciona.
//		System.out.println("DeleteUser-DELETE:");
//		command.deleteUser(1);
//		
////		Actualizar-Funciona.
//		System.out.println("UpdateUser-UPDATE:");
//		user1.setName("Chicharito");
//		command.updateUser(user1);
//		
////		Crear o Actualizar - Funciona
//		System.out.println("Guardar");
//		command.saveOrUpdate(user2);
//		System.out.println("Actualizar");
//		user.setName("Horus");
//		command.saveOrUpdate(user2);
//		
//		
////		Listado Enum
//		System.out.println("Listado ENUM");
//		List <User> userList = UserListEnum.INSTANCE.getUserList();
//		for (User users : userList) {
//			System.out.println(users);
//		}
		
//		Cargar Registros
		List<User> userListFile = new ArrayList<>();

        // Agregando usuarios a la lista
        User u1 = (User) context.getBean("user");
        u1.setName("Carlos");
        u1.setLastName("Jaramillo");
        u1.setDni("A1234B");
        u1.setRole("Usuario");
        u1.setMail("carlos@gmail.com");
        u1.setPhone("333000333");
        u1.setPassword("123");
        u1.setGender("Masculino");
        u1.setBirth(new Date());

        // Obtener y configurar el segundo usuario
        User u2 = (User) context.getBean("user");
        u2.setName("María");
        u2.setLastName("González");
        u2.setDni("B5678C");
        u2.setRole("Administrador");
        u2.setMail("maria@gmail.com");
        u2.setPhone("333000333");
        u2.setPassword("567");
        u2.setGender("Femenino");
        u2.setBirth(new Date());

        // Obtener y configurar el tercer usuario
        User u3 = (User) context.getBean("user");
        u3.setName("Juan");
        u3.setLastName("Pérez");
        u3.setDni("C91011D");
        u3.setRole("Usuario");
        u3.setMail("juan@gmail.com");
        u3.setPhone("333000333");
        u3.setPassword("91011");
        u3.setGender("Masculino");
        u3.setBirth(new Date());

        // Obtener y configurar el cuarto usuario
        User u4 = (User) context.getBean("user");
        u4.setName("Laura");
        u4.setLastName("López");
        u4.setDni("D121314E");
        u4.setRole("Usuario");
        u4.setMail("laura@gmail.com");
        u4.setPhone("333000333");
        u4.setPassword("121314");
        u4.setGender("Femenino");
        u4.setBirth(new Date());

        // Obtener y configurar el quinto usuario
        User u5 = (User) context.getBean("user");
        u5.setName("Ana");
        u5.setLastName("Martínez");
        u5.setDni("E151617F");
        u5.setRole("Usuario");
        u5.setMail("ana@gmail.com");
        u5.setPhone("333000333");
        u5.setPassword("151617");
        u5.setGender("Femenino");
        u5.setBirth(new Date());

        // Obtener y configurar el sexto usuario
        User u6 = (User) context.getBean("user");
        u6.setName("Pedro");
        u6.setLastName("Sánchez");
        u6.setDni("F181920G");
        u6.setRole("Usuario");
        u6.setMail("pedro@gmail.com");
        u6.setPhone("333000333");
        u6.setPassword("181920");
        u6.setGender("Masculino");
        u6.setBirth(new Date());

        // Obtener y configurar el séptimo usuario
        User u7 = (User) context.getBean("user");
        u7.setName("Lucía");
        u7.setLastName("Rodríguez");
        u7.setDni("G212223H");
        u7.setRole("Usuario");
        u7.setMail("lucia@gmail.com");
        u7.setPhone("333000333");
        u7.setPassword("212223");
        u7.setGender("Femenino");
        u7.setBirth(new Date());

        // Obtener y configurar el octavo usuario
        User u8 = (User) context.getBean("user");
        u8.setName("David");
        u8.setLastName("García");
        u8.setDni("H242526I");
        u8.setRole("Usuario");
        u8.setMail("david@gmail.com");
        u8.setPhone("333000333");
        u8.setPassword("242526");
        u8.setGender("Masculino");
        u8.setBirth(new Date());

        // Obtener y configurar el noveno usuario
        User u9 = (User) context.getBean("user");
        u9.setName("Catalina");
        u9.setLastName("Hernández");
        u9.setDni("I272829J");
        u9.setRole("Usuario");
        u9.setMail("sofia@gmail.com");
        u9.setPhone("333000333");
        u9.setPassword("272829");
        u9.setGender("Femenino");
        u9.setBirth(new Date());
		
        
        command.saveUser(u1);
        command.saveUser(u2);
        command.saveUser(u3);
        command.saveUser(u4);
        command.saveUser(u5);
        command.saveUser(u6);
        command.saveUser(u7);
        command.saveUser(u8);
        command.saveUser(u9);
		command.saveUserList(userListFile);
		
	}
}
