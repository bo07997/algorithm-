package com.lin.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lin.dao.UserMapper;
import com.lin.model.User;
import com.lin.service.UserServiceI;

@Service("userService")
public class UserServiceimpl implements UserServiceI {

	@Resource
	private UserMapper userMapper;

	@Autowired
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}


	@Override
	public User getUserById(int Uid) {
		
		return userMapper.selectByPrimaryKey(Uid);
	}


	@Override
	public boolean insertSelective(User user) {
		// TODO Auto-generated method stub
		
		return userMapper.insertSelective(user)==1?true:false;
	}


	@Override
	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		return userMapper.selectByUsername(username);
	}



}
