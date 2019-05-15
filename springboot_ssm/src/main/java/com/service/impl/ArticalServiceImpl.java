package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.ArticalMapper;
import com.domain.Artical;
import com.service.ArticalService;

@Service
public class ArticalServiceImpl implements ArticalService{

	@Resource
	ArticalMapper articalMapper;
	@Override
	public List<Artical> findAll() {
		
		List<Artical> articals =articalMapper.findAll();
		return articals;
	}
	@Override
	public Artical findById(Integer id) {
		Artical artical =articalMapper.findById(id);
		return artical;
	}
	@Override
	public List<Artical> ArticalByType(String type) {
		List<Artical> articals =articalMapper.ArticalByType(type);
		return articals;
	}
	@Override
	public List<Artical> recommendAll(String name) {
		List<Artical> articals =articalMapper.recommendAllA(name);
		return articals;
	}

}
