package com.service;

import java.util.List;
import java.util.Map;

import com.domain.Hospital;


public interface HospitalService {

	 List<Hospital> findAll() ;

	Hospital findByName(String name);

	List<Hospital>  simpleSelect(String name);//模糊查找

	List<Hospital> MoreSelect(Map<String, Object> map);

	List<Hospital> findByDepartment(String name);

	List<Hospital> SelectByMore(String name, String category, String type, Integer rating);

	List<Hospital> findAllByRating2();



	List<Hospital> findAllByType(String type);

	List<Hospital> findAllByDistance();

	

	List<Object> Select(String name);

	List<Hospital> findAllByCategory(String category);

	List<Hospital> findAllByRating1();

	List<Hospital> findAllByConcreteDistance(double minlat, double maxlat,
			double minlng, double maxlng);

	List<Hospital> recommendAll(String name);

	void insertHospital(String uName, String hName);





}
