package com.service;

import java.util.List;

import com.domain.Artical;


public interface ArticalService {

	List<Artical> findAll();

	Artical findById(Integer id);

	List<Artical> ArticalByType(String type);

	List<Artical> recommendAll(String name);

}
