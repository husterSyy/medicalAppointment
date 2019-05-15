package com.dao;

import com.domain.Rating;
import com.domain.RatingExample;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;


@Mapper
@Repository
public interface RatingMapper {
	 @Select("select * from rating  where dName=#{name}")
		List<Rating> findAll(String name);
		
		 @Select("select * from rating  where dId = #{id}")
			List<Rating> findAllById(Integer id);  
	
	
    long countByExample(RatingExample example);


    float avgBySkill();
    float avgByService();
    float avgByEffect();
    
    int deleteByExample(RatingExample example);

    int deleteByPrimaryKey(Integer rid);

    int insert(Rating record);

    int insertSelective(Rating record);

    List<Rating> selectByExample(RatingExample example);

    Rating selectByPrimaryKey(Integer rid);

    int updateByExampleSelective(@Param("record") Rating record, @Param("example") RatingExample example);

    int updateByExample(@Param("record") Rating record, @Param("example") RatingExample example);

    int updateByPrimaryKeySelective(Rating record);

    int updateByPrimaryKey(Rating record);
}