package com.service;

import java.util.List;

import com.domain.Clinic;
import com.domain.Department;

public interface DepartmentService {
	
	Department selectDepartment(String name) ;

	List<Clinic> findClinic(String name);

	List<Department> allDepartment();
		
     
}
