package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.dao.UserMapper;
import com.domain.User;
import com.service.UserService;

@Service
public class UserServiceImpl implements UserService {
    
	@Resource
	private UserMapper usermapper;
	
	
	
	 @Override
	    public void save(User user) {
	        // TODO Auto-generated method stub
	        usermapper.save(user);
	    }

	    @Override
	    public int update(User user) {
	        // TODO Auto-generated method stub
	        return usermapper.update(user);
	    }

	    @Override
	    public boolean delete(Integer id) {
	        // TODO Auto-generated method stub
	        return usermapper.delete(id);
	    }

	    @Override
	    public User findById(Integer  id) {
	        // TODO Auto-generated method stub
	        User user=usermapper.findById(id);
	        return user;
	    }

	    @Override
	    public List<User> findAll() {
	        // TODO Auto-generated method stub
	        List<User> findAllList=usermapper.findAll();
	        return findAllList;
	    }

		@Override
		public void insertUser(String username, String password, String email) {
			usermapper.insertUser(username,password,email);
		}

		@Override
		public User selectUserByName(String name) {
			User user=usermapper.selectUserByName(name);
			return user;
		}
		@Override
		public User selectAllByName(String name) {
			User user=usermapper.selectAllByName(name);
			return user;
		}
		@Override
		public User selectUserByNameAndPassword(String name, String password) {
			User user=usermapper.selectUserByNameAndPassword(name,password);
			return user;
		}

		@Override
		public List<User> getUserList() {
			List<User> findAllList=usermapper.findAll();
	        return findAllList;
		}

		@Override
		public void insertDoctor(@Param("uName")String uName,@Param("dName")String dName) {
			usermapper.insertDoctor(uName, dName);
			
		}

		

		@Override
		public User getUserByEmail(String email) {
			User user=usermapper.getUserByEmail(email);
			return user;
		}

		@Override
		public void changeEmail(String email,String name) {
			usermapper.changeEmail(email,name);
			
		}

		@Override
		public void changePassword(String npassword, String name) {
			usermapper.changePassword(npassword,name);
			
		}

	
}
