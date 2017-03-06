package com.lin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lin.dao.UserMapper;
import com.lin.model.User;
import com.lin.model.v2model.Root_message;
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
		return userMapper.insertSelective(user)==1?true:false;
	}


	@Override
	public User getUserByUsername(String username) {
		return userMapper.selectByUsername(username);
	}


	@Override
	public boolean validateUsername(String username) {
		
		 if(userMapper.selectUNByUN(username)!=null){
		 return true;
		 }
		 return false;
	}


	@Override
	public boolean insertUser(User user) {
		return userMapper.insert(user);
	}


	@Override
	public boolean updateMid(int uid) {
		return userMapper.updateMid(uid);
	}


	@Override
	public List<Map<Object, Object>> findskill(int uId) {
		return userMapper.selectSkill( uId);
	}


	@Override
	public boolean updateByPrimaryKeySelective(User user) {
		
		return userMapper.updateByPrimaryKeySelective(user);
	}


	@Override
	public List<User> getAlluser() {
		return userMapper.selectAlluser();
	}


	@Override
	public List<Map<Object, Object>> getAlluser_message() {
		return userMapper.selectAlluser_message();
	}


	@Override
	public boolean deleteuser(int uId) {
		return userMapper.deleteByPrimaryKey(uId);
	}


	@Override
	public boolean beManager(User user) {
		return userMapper.updateByPrimaryKeySelective(user);
	}


	@Override
	public List<Map<Object, Object>> getAllroot_message() {
		return userMapper.selectAllroot_message();
	}


	@Override
	public boolean update_root(Root_message root_message) {
		return userMapper.update_root(root_message);
	}


	@Override
	public User getUserByUser(User u1) {
		return userMapper.selectUserByUser(u1);
	}






}
