package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SdepartmentMapper;
import com.domain.Sdepartment;
import com.service.SdepartmentService;

@Service
public class SdepartmentServiceImpl implements SdepartmentService {
	@Autowired
	SdepartmentMapper sdepartmentMapper;
	@Override
	public List<Sdepartment> findAllSdepartment() {
		
		List<Sdepartment> sdepartments=sdepartmentMapper.findAllSdepartment();
		
		return sdepartments;
	}
 
}
