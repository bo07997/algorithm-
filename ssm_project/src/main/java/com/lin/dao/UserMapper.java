package com.lin.dao;

import org.springframework.stereotype.Repository;

import com.lin.model.User;
@Repository 
public interface UserMapper {
    int deleteByPrimaryKey(int uId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(int uId);
    
    User selectByUsername(String username);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}