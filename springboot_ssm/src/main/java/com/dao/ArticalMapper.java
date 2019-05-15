package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.domain.Artical;

@Mapper
@Repository
public interface ArticalMapper {

	public List<Artical> findAll() ;

	
	 @Select("SELECT * FROM artical WHERE   aId=#{id}  ")
	    @Results({
	            @Result(property = "aRatingList", column = "aId",
	                    many = @Many(select = "com.dao.ARatingMapper.findAllARById"))
	    })
	public Artical findById(Integer id);


	public List<Artical> ArticalByType(String type);


	public List<Artical> recommendAllA(String name);

}
