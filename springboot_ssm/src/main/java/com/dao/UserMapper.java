package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.domain.User;

@Mapper
@Repository
public interface UserMapper {
	
	 @Select("SELECT * FROM user WHERE   uName=#{name}")
	    @Results({
	            @Result(property = "doctorList", column = "uName",
	                    many = @Many(select = "com.dao.DoctorMapper.findAllDByuName")),
	            @Result(property = "hospitalList", column = "uName",
                many = @Many(select = "com.dao.HospitalMapper.findAllHByuName")),
	            @Result(property = "orderList", column = "uName",
                many = @Many(select = "com.dao.OrdersMapper.findAllOByuName"))
	    })
  User selectAllByName(String name);
  void save(User user);
  int update(User user);
  boolean delete(Integer id);
  User findById(Integer id);
  List<User> findAll();
   void insertUser(@Param("username")String username, @Param("password")String password, @Param("email")String email);
User selectUserByNameAndPassword(@Param("name")String name, @Param("password")String password);

List<User> getUserList();
void insertDoctor(@Param("uName")String uName,@Param("dName")String dName);
User selectUserByName(String name);

User getUserByEmail(String email);
void changeEmail(@Param("email")String email, @Param("name")String name);
void changePassword(@Param("npassword")String npassword,@Param("name") String name);
User findByMobile(String mobile);

}
