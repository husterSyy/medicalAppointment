package com.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.domain.Product;
@Mapper
@Repository
public interface ProductMapper {
  
    int deleteByPrimaryKey(String id);

    int insert(Product record);

    int insertSelective(Product record);

 
    Product selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

	List<Product> findAll();

	Product selectByPid(String productId);
}