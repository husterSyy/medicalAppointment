package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ProductMapper;
import com.domain.Product;
import com.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public List<Product> getProducts() {
		

		List<Product> list = productMapper.findAll();
		
		return list;
	}

	@Override
	public Product getProductById(String productId) {
		
		return productMapper.selectByPid(productId);
	}

}
