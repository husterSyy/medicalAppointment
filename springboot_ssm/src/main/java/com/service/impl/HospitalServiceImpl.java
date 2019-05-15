package com.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HospitalMapper;
import com.domain.Hospital;
import com.service.HospitalService;


@Service
public class HospitalServiceImpl implements HospitalService {
	@Resource
	private HospitalMapper hospitalMapper;

	@Override
	public List<Hospital> findAll() {
		// TODO Auto-generated method stub
		List<Hospital> findAllHlist=hospitalMapper.findAllH();
		return findAllHlist;
	}

	@Override
	public Hospital findByName(String name) {
		// TODO Auto-generated method stub
		Hospital hospital=hospitalMapper.findByName(name);
		return hospital;
	}

	@Override
	public List<Hospital> simpleSelect(String name) {
		List<Hospital>  hospital=hospitalMapper.simpleSelect(name);
		return hospital;
	}

	@Override
	public List<Hospital> MoreSelect(Map<String, Object> map) {
		List<Hospital>  hospital=hospitalMapper.MoreSelect(map);
		return hospital;
	}

	@Override
	public List<Hospital> findByDepartment(String name) {
		List<Hospital>  hospital=hospitalMapper.findByDepartment(name);
		return hospital;
	}

	@Override
	public List<Hospital> SelectByMore(String name, String category, String type,Integer rating) {
		List<Hospital>  hospital=hospitalMapper.SelectByMore(name,category,type,rating);
		return hospital;
	}

	@Override
	public List<Hospital> findAllByRating2() {
		List<Hospital>  hospital=hospitalMapper.findAllByRatingD();
		return hospital;
	}

	@Override
	public List<Hospital> findAllByRating1() {
		List<Hospital>  hospital=hospitalMapper.findAllByRatingA();
		return hospital;
	}

	@Override
	public List<Hospital> findAllByType(String type) {
		List<Hospital>  hospital=hospitalMapper.findAllByType(type);
		return hospital;
	}

	@Override
	public List<Hospital> findAllByDistance() {
		List<Hospital>  hospital=hospitalMapper.findAllByDistance();
		return hospital;
	}

	@Override
	public List<Hospital> findAllByCategory(String category) {
		List<Hospital>  hospital=hospitalMapper.findAllByCategory(category);
		return hospital;
	}

	@Override
	public List<Object> Select(String name) {
		List<Object>  hospital=hospitalMapper.Select(name);
		return hospital;
	}

	@Override
	public List<Hospital> findAllByConcreteDistance(double minlat,
			double maxlat, double minlng, double maxlng) {
		List<Hospital>  hospital=hospitalMapper.findAllByConcreteDistance(minlat,maxlat,minlng,maxlng);
		return hospital;
		
	}

	@Override
	public List<Hospital> recommendAll(String name) {
		List<Hospital> findAllHlist=hospitalMapper.recommendAllH(name);
		return findAllHlist;
	}

	@Override
	public void insertHospital(String uName, String hName) {
		hospitalMapper.insertHospital(uName, hName);
		
	}



}
