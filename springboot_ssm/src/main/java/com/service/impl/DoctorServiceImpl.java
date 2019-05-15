package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.DoctorMapper;
import com.domain.Doctor;
import com.domain.User;
import com.service.DoctorService;

@Service
public class DoctorServiceImpl implements DoctorService{
	@Resource
         DoctorMapper doctorMapper;
	@Override
	public List<Doctor> simpleSelect(String name) {
		
		List<Doctor>  doctor=doctorMapper.simpleSelect(name);
		return doctor;
	}
	@Override
	public List<Doctor> findAll() {
		List<Doctor> doctor=doctorMapper.findAll();
		return doctor;
	}
	@Override
	public Doctor findByName(String name) {
		Doctor  doctor=doctorMapper.findByName(name);
		return doctor;
	}
	@Override
	public Doctor findById(Integer id) {
		Doctor  doctor=doctorMapper.findById(id);
		return doctor;
	}
	@Override
	public List<Doctor> findByRatingD() {
		List<Doctor> doctor=doctorMapper.findByRatingD();
		return doctor;
	}
	@Override
	public List<Doctor> findByRatingA() {
		List<Doctor> doctor=doctorMapper.findByRatingA();
		return doctor;
	}
	@Override
	public List<Doctor> findByType(String type) {
		List<Doctor> doctor=doctorMapper.findByType(type);
		return doctor;
	}
	@Override
	public List<Doctor> findByInquisitionD() {
		List<Doctor> doctor=doctorMapper.findByInquisitionD();
		return doctor;
	}
	@Override
	public List<Doctor> findByInquisitionA() {
		List<Doctor> doctor=doctorMapper.findByInquisitionA();
		return doctor;
	}
	@Override
	public List<Doctor> SelectByMore(String type, String department, Integer rating) {
		List<Doctor> doctor=doctorMapper.findByMore(type,department,rating);
		return doctor;
	}
	@Override
	public Doctor findIdByName(String name) {
		Doctor doctor=doctorMapper.findIdByName(name);
		return doctor;
	}
	@Override
	public List<Doctor> recommendAll(String name) {
		List<Doctor> doctor=doctorMapper.recommendAll(name);
		return doctor;
	}
	@Override
	public Doctor selectDoctorByNameAndPassword(String name, String password) {
		Doctor doctor=doctorMapper.selectDoctorByNameAndPassword(name,password);
		return  doctor;
	}

}
