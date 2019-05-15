package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.domain.Sdepartment;

@Mapper
@Repository
public interface SdepartmentMapper {

	List<Sdepartment> findAllSdepartment();
	
	List<Sdepartment> findAllById(Integer id);
}
