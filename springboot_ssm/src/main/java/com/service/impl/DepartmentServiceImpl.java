package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.DepartmentMapper;
import com.domain.Clinic;
import com.domain.Department;
import com.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	@Resource
        DepartmentMapper departmentMapper;
	@Override
	public Department selectDepartment(String name) {
		
		// TODO Auto-generated method stub
		Department department=departmentMapper.selectDepartment(name);
		return department;
	}
	@Override
	public List<Clinic> findClinic(String name) {
		List<Clinic> clinicList=departmentMapper.findClinic(name);
		return clinicList;
	}
	@Override
	public List<Department> allDepartment() {
		List<Department> departmentList=departmentMapper.findAll();
		return departmentList;
	}

}
