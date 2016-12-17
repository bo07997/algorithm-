package com.lin.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lin.dao.BlogMapper;
import com.lin.model.Blog;
import com.lin.service.BlogServiceI;
@Service("blogService")
public class BlogServiceimpl implements BlogServiceI {

	@Resource
	private BlogMapper blogMapper;
	
	@Autowired
	public void setBlogMapper(BlogMapper blogMapper) {
		this.blogMapper = blogMapper;
	}


	@Override
	public List<Blog> getHomeList(String date) {
		// TODO Auto-generated method stub
		return blogMapper.selectList( date);
	}


	@Override
	public Blog getcontById(int id) {
		return blogMapper.selectByPrimaryKey(id);
	}

}
