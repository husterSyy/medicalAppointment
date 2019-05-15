package com.dao;




import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.domain.Hospital;
@Mapper
@Repository
public interface HospitalMapper {
	
	


	List<Hospital> findAllHByDisease(String name);
	
    Hospital findByName(@Param(value="name")String name);

	List<Hospital> findAllH();

	List<Hospital>  simpleSelect(String name);

	List<Hospital> MoreSelect(Map<String, Object> map);

	List<Hospital> findByDepartment(String name);

	List<Hospital> SelectByMore(@Param("name")String name, @Param("category")String category,@Param("type") String type, @Param("rating")Integer rating);

	List<Hospital> findAllByRatingD();

	List<Hospital> findAllByRatingA();

	List<Hospital> findAllByType(String type);

	List<Hospital> findAllByDistance();
	List<Hospital> findAllByConcreteDistance(@Param("minlat")double minlat,@Param("maxlat")double maxlat,@Param("minlng")double minlng,@Param("maxlng")double maxlng);


	List<Object> Select(String name);

	List<Hospital> findAllByCategory(String category);

	List<Hospital> selectHospitalsByPage(Integer id);

	List<Hospital> recommendAllH(String name);

	
	void insertHospital(@Param("uName")String uName,@Param("hName") String hName);

	

	
    

}