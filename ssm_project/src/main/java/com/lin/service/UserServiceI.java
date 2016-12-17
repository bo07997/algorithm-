package com.lin.service;

import com.lin.model.User;

public interface UserServiceI {

	public User getUserById(int  Uid);
	
	public User getUserByUsername(String username);
	
	boolean insertSelective(User record);
	
}
