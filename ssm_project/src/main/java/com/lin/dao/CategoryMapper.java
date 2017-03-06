package com.lin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.lin.model.Category;
@Repository 
public interface CategoryMapper {
    boolean deleteByPrimaryKey(int cId);

    int insert(Category record);

    boolean insertSelective(Category record);

    Category selectByPrimaryKey(int cId);

    boolean updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

	List<Category> selectByuId(int uId);

	Category isRepeat(Category category);
}