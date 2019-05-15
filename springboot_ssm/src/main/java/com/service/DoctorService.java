package com.service;

import java.util.List;

import com.domain.Doctor;


public interface DoctorService {

	List<Doctor> simpleSelect(String name);

	List<Doctor> findAll();

	Doctor findByName(String name);

	Doctor findById(Integer id);


	List<Doctor> findByRatingA();

	List<Doctor> findByType(String type);

	List<Doctor> findByInquisitionD();
	List<Doctor> findByInquisitionA();

	List<Doctor> SelectByMore(String type, String department, Integer rating);

	List<Doctor> findByRatingD();

	Doctor findIdByName(String name);

	List<Doctor> recommendAll(String name);

	Doctor selectDoctorByNameAndPassword(String name, String password);

}
