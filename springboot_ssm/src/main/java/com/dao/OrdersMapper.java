package com.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.domain.Orders;
@Mapper
@Repository
public interface OrdersMapper {
  
    int deleteByPrimaryKey(String id);

    int insert(Orders record);

    int insertSelective(Orders record);

 

    Orders selectByPrimaryKey(String id);

 
    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);
}