package com.lin.dao;

import org.springframework.stereotype.Repository;

import com.lin.model.Message;
@Repository 
public interface MessageMapper {
    int deleteByPrimaryKey(int messageId);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(int messageId);

    boolean updateByPrimaryKeySelective(Message message);

    int updateByPrimaryKey(Message record);
}