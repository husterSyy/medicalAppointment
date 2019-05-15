package com.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.domain.Flow;
@Mapper
@Repository
public interface FlowMapper {
  

    int deleteByPrimaryKey(String id);

    int insert(Flow record);

    int insertSelective(Flow record);

   
    Flow selectByPrimaryKey(String id);

  
  
    int updateByPrimaryKeySelective(Flow record);

    int updateByPrimaryKey(Flow record);
}