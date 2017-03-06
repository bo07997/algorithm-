package com.lin.service;

import java.util.List;

import com.lin.model.Category;

public interface CategoryServiceI {
//查找分类
	public List<Category> getCateByuId(int uId);
//删除分类
	public boolean deletecateById(int cId);
//修改分类
	public boolean updatecateById(Category category);
	public boolean addCate(Category category);
	public boolean isRepeat(Category category);
}
