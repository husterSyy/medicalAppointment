package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.domain.ARating;

@Mapper
@Repository
public interface ARatingMapper {
	
	 @Select("select * from arating  where aId = #{id}")
	List<ARating> findAllARById(Integer id);
}
