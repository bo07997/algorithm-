package com.lin.dao;


import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.lin.model.Blog;
@Repository 
public interface BlogMapper {
    List<Blog> selectList(String date);
	
    int deleteByPrimaryKey(int bId);

    int insert(Blog record);

    int insertSelective(Blog record);

    Blog selectByPrimaryKey(int bId);

    int updateByPrimaryKeySelective(Blog record);

    int updateByPrimaryKeyWithBLOBs(Blog record);

    int updateByPrimaryKey(Blog record);
}