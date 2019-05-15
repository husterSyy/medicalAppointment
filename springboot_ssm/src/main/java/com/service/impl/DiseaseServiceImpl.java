package com.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.DiseaseMapper;
import com.domain.Disease;
import com.service.DiseaseService;
@Service
public class DiseaseServiceImpl implements DiseaseService{
    @Resource
	DiseaseMapper diseaseMapper;
	@Override
	public Disease findDiseaseByName(String name) {
		
		Disease disease=diseaseMapper.findByName(name);
		
		return disease;
	}

}
