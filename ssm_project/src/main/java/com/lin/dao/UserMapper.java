package com.lin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.lin.model.User;
import com.lin.model.v2model.Root_message;
@Repository 
public interface UserMapper {
    boolean deleteByPrimaryKey(int uId);

    boolean insert(User record);

   int insertSelective(User record);

    User selectByPrimaryKey(int uId);
    
    User selectByUsername(String username);

    boolean updateByPrimaryKeySelective(User record);

    boolean updateByPrimaryKey(User record);

	String selectUNByUN(String username);

	boolean updateMid(int uid);

	List<Map<Object, Object>> selectSkill(int uId);

	//查询全部用户
	List<User> selectAlluser();

	//获取全部用户及其信息
	List<Map<Object, Object>> selectAlluser_message();

	//获取全部管理员及其信息
	List<Map<Object, Object>> selectAllroot_message();

	//更新管理员及其信息
	boolean update_root(Root_message root_message);

	//获取用户或者管理员
	User selectUserByUser(User u1);
}