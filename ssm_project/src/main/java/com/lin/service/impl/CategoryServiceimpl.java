package com.lin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lin.dao.CategoryMapper;
import com.lin.model.Category;
import com.lin.service.CategoryServiceI;
@Service("categoryService")
public class CategoryServiceimpl implements CategoryServiceI {
   @Resource
  private CategoryMapper categoryMapper;	
	
   @Autowired
	public void setCategoryMapper(CategoryMapper categoryMapper) {
	this.categoryMapper = categoryMapper;
}


//   通过用户ID查询分类List
	@Override
	public List<Category> getCateByuId(int uId) {
		// TODO Auto-generated method stub
		return categoryMapper.selectByuId(uId);
	}


	@Override
	public boolean deletecateById(int cId) {
		// TODO Auto-generated method stub
		return categoryMapper.deleteByPrimaryKey(cId);
	}


	@Override
	public boolean updatecateById(Category category) {
		return categoryMapper.updateByPrimaryKeySelective(category);
	}


	@Override
	public boolean addCate(Category category) {
		return categoryMapper.insertSelective(category);
	}


	@Override
	public boolean isRepeat(Category category) {
		   Category gCategory= categoryMapper.isRepeat(category);
		   if (gCategory!=null) {
			return true;
		}
		   return false;
	}

}
