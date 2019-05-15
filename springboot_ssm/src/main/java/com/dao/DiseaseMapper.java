package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.domain.Disease;

@Mapper
@Repository
public interface DiseaseMapper {
		
	
	List<Disease> findAllById(Integer id);

	 @Select(" SELECT * FROM disease  where sName=#{name}")
	    @Results({
	    	 @Result(property = "hospitalList", column = "sName",
	                    many = @Many(select = "com.dao.HospitalMapper.findAllHByDisease")),
	    	 @Result(property = "doctorList", column = "sName",
	                    many = @Many(select = "com.dao.DoctorMapper.findAllByDisease"))
	    })
	Disease findByName(String name);
}
