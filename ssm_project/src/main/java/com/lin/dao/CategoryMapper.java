package com.lin.dao;

import org.springframework.stereotype.Repository;

import com.lin.model.Category;
@Repository 
public interface CategoryMapper {
    int deleteByPrimaryKey(int cId);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(int cId);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
}