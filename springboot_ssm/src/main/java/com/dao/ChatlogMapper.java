package com.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.domain.Chatlog;
import com.domain.ChatlogExample;

public interface ChatlogMapper {
    long countByExample(ChatlogExample example);

    int deleteByExample(ChatlogExample example);

    int deleteByPrimaryKey(Integer mid);

    int insert(Chatlog record);

    int insertSelective(Chatlog record);

    List<Chatlog> selectByExample(ChatlogExample example);

    Chatlog selectByPrimaryKey(Integer mid);

    int updateByExampleSelective(@Param("record") Chatlog record, @Param("example") ChatlogExample example);

    int updateByExample(@Param("record") Chatlog record, @Param("example") ChatlogExample example);

    int updateByPrimaryKeySelective(Chatlog record);

    int updateByPrimaryKey(Chatlog record);
}