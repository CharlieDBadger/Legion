package interfaces;

import java.util.List;

import entities.User;

public interface UserDaoInterface {
	//CREATE
	public void saveUser(User user);
	
	//READ
	public User getUserId(long id);
	
	public User getUserDni(String dni);
	
	public List<User> getUserList();
	
	//DELETE
	public void deleteUser(long id);
	
	//UPDATE
	public void updateUser(User user);
	
	//CREATE OR UPDATE
	public void saveOrUpdate(User user);
	
}
