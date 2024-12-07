package commands;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;

import entities.User;
import interfaces.UserDaoInterface;

public class UserCommand implements UserDaoInterface {

	// private SessionFactory sessionFactory;
	@Autowired
	private HibernateTemplate template;
	
	private static final Logger logger = LogManager.getLogger(User.class);

	public UserCommand() {
	}

	/**
	 * CREATE
	 */
	public void saveUser(User user) {
		template.save(user);
		logger.info("User Inserted");
	}

	/**
	 * READ
	 */
	public User getUserId(long id) {
		String query = "from User where id = ?";
		logger.info("Searching User by Id: " + id + ".");
		return (User) template.find(query, id).get(0);
		
	}

	public User getUserDni(String dni) {
		String query = "from User where dni = ?";
		logger.info("Searching User by Dni: " + dni + ".");
		return (User) template.find(query, dni).get(0);
	}

	public User getUserLogin(String dni, String password) {
	    String query = "from User where dni = '" + dni + "' and password = '" + password + "'";
	    List<User> users = (List<User>) template.find(query);
	    
	    if (!users.isEmpty()) {
	        return users.get(0);
	    } else {
	        return null; 
	    }
	}
	
	public List<User> getUserList() {
		String query = "from User";
		List<User> list = (List<User>) template.find(query);
		logger.info("Getting all Users.");
		return list;
	}

	/**
	 * DELETE
	 */
	public void deleteUser(long id) {
		User search = getUserId(id);
		logger.info("User " + search + "deleted.");
		template.delete(search);
	}

	/**
	 * UPDATE
	 */
	public void updateUser(User user) {
		logger.info("Updating User.");
		template.update(user);
	}

	/**
	 * CREATE OR UPDATE
	 */
	public void saveOrUpdate(User user) {
		template.saveOrUpdate(user);
	}
	
	public void saveUserList(List <User> userList) {
		
		for (User user : userList) {
			saveUser(user);
			logger.info(user + "insertado.");
		}
		logger.info("Users Inserteds");
	}
}
