package com.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Many;

import com.domain.Doctor;


public interface DoctorMapper {
  
	List<Doctor> findAllByDisease(String name);

	List<Doctor> simpleSelect(String name);

	List<Doctor> findAll();

	 @Select("SELECT * FROM doctor WHERE   dName=#{name}")
	    @Results({
	            @Result(property = "ratingList", column = "dName",
	                    many = @Many(select = "com.dao.RatingMapper.findAll"))
	    })
	Doctor findByName(@Param("name")String name);

	 @Select("SELECT * FROM doctor WHERE   dId=#{id}  ")
	    @Results({
	            @Result(property = "aRatingList", column = "aId",
	                    many = @Many(select = "com.dao.ARatingMapper.findAllById"))
	    })
	Doctor findById(Integer id);

	List<Doctor> findByRatingD();

	List<Doctor> findByRatingA();

	List<Doctor> findByType(String type);

	List<Doctor> findByInquisitionD();
	
	List<Doctor> findByInquisitionA();

	List<Doctor> findByMore(@Param("type")String type, @Param("department")String department, @Param("rating")Integer rating);

	Doctor findIdByName(String name);

	List<Doctor> recommendAll(String name);

	Doctor selectDoctorByNameAndPassword(@Param("name")String name, @Param("password")String password);
}