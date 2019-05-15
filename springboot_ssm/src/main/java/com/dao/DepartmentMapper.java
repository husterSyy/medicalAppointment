package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.domain.Clinic;
import com.domain.Department;

@Mapper
@Repository
public interface DepartmentMapper {

	 Department selectDepartment(String name) ;

	List<Clinic> findClinic(String name);

	
	 @Select("SELECT * FROM department")
	    @Results({
	            @Result(property = "sDepartmentList", column = "dId",
	                    many = @Many(select = "com.dao.SdepartmentMapper.findAllById")),
	            @Result(property = "diseaseList", column = "dId",
                many = @Many(select = "com.dao.DiseaseMapper.findAllById"))
	    })
	List<Department> findAll();
	

}
