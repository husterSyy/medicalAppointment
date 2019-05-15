package com.service;

import java.util.List;













import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.domain.User;


@Service
public interface UserService {
    

	
	    public void save(User user) ;

	    public int update(User user) ;
	   
	    public boolean delete(Integer id) ;
	   
	    public User findById(Integer  id) ;
	  
	    public List<User> findAll();
	
		public void insertUser(String username, String password, String email) ;
	
		public User selectUserByName(String name);

		public User selectUserByNameAndPassword(String name, String password);

		public List<User> getUserList();

		

		public void insertDoctor(@Param("uName")String uName,@Param("dName")String dName);

		User selectAllByName(String name);

		

		public User getUserByEmail(String email);

		public void changeEmail(String email,String name);

		public void changePassword(String npassword, String name);

		

		
		

	
}
