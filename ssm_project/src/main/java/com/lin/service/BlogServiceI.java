package com.lin.service;

import java.sql.Date;
import java.util.List;

import com.lin.model.Blog;

public interface BlogServiceI {

	//选择某个时间段之后的数据
	public List<Blog> getHomeList(String date);
	
	public Blog getcontById(int id);
	
	
}