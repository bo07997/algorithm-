package com.lin.service;

import java.util.List;
import java.util.Map;

import com.lin.model.User;
import com.lin.model.v2model.Root_message;

public interface UserServiceI {

	public User getUserById(int  Uid);
	
	public User getUserByUsername(String username);
	
	boolean insertSelective(User record);

	public boolean validateUsername(String username);

	public boolean insertUser(User user);

	public boolean updateMid(int uid);
	
	public  List<Map<Object, Object> >findskill(int uId);
	
	public boolean updateByPrimaryKeySelective(User user);

	//获取全部用户
	public List<User> getAlluser();

	//获取全部用户及其信息
	public List<Map<Object, Object>> getAlluser_message();

	//删除用户
	public boolean deleteuser(int uId);

	//提升用户为管理员 
	public boolean beManager(User user);
	//获取全部管理员及其信息
	public List<Map<Object, Object>> getAllroot_message();

	//更新管理员及其信息
	public boolean update_root(Root_message root_message);

	//获取用户或者管理员
	public User getUserByUser(User u1);


}
