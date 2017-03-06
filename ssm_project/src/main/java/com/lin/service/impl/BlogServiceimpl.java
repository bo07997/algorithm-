package com.lin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lin.dao.BlogMapper;
import com.lin.model.Blog;
import com.lin.model.v2model.Blog_table;
import com.lin.model.v2model.Blogv2;
import com.lin.service.BlogServiceI;
import com.sun.jndi.url.iiopname.iiopnameURLContextFactory;
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
		return blogMapper.selectList( date);
	}


	@Override
	public Blog getcontById(int id) {
		return blogMapper.selectByPrimaryKey(id);
	}


	@Override
	public  List<Blogv2> getMapList(int uId) {
		
		return blogMapper.selectMapList(uId);
	}


	@Override
	public List<Blog> getreadTimesList(int uId) {
		
		return blogMapper.selectreadTimesList(uId);
	}


	@Override
	public List<Blog> getreadcommonsList(int uId) {
		return blogMapper.selectcommonsTimesList(uId);
	}


	@Override
	public List<Blog> getallList(int uId) {
		return blogMapper.selectallList(uId);
	}


	@Override
	public List<Blog> getcateList(Map<String, Integer> catemap) {
		return blogMapper.selectcateList(catemap);
	}


	@Override
	public List<Blog> getreblogList(int uId) {
		return blogMapper.selectreblogList(uId);
	}


	@Override
	public List<Blog> getdraftblogList(int uId) {
		return blogMapper.selectdraftblogList(uId);
	}


	@Override
	public boolean deleteBlogBybId(int bId) {
		return blogMapper.deleteByPrimaryKey(bId);
	}


	@Override
	public List<Blog> getblogsByDate(Map<String, String> catemap) {
		return blogMapper.seleteblogsByDate(catemap);
		
	}


	@Override
	public boolean addNewBlog(Blog new_blog) {
		return blogMapper.insertSelective_root(new_blog);
	}


	@Override
	public boolean updateBlog(Blog new_blog) {
		return blogMapper.updateByPrimaryKeyWithBLOBs(new_blog);
	}


	@Override
	public boolean updatecateById(Blog_table blog_table) {
		return blogMapper.updateCateId(blog_table);
	}


	@Override
	public boolean updatecommonauth(Blog_table blog_table) {
		return blogMapper.updatecommonauth(blog_table);
	}


	@Override
	public Blog getcontByMap(Map<String, Object> blogmap) {
		return blogMapper.selectcontByMap(blogmap);
	}


	@Override
	public boolean updatedraftBlogByblog(Blog blog) {
		//取出bId
		int bId=blog.getbId();
		//先提交
		blog.setbId(0);
		boolean update_result=blogMapper.insertSelective_root(blog);
		//删除结果
		boolean del_result=false;
	//提交成功后删除
		if(update_result==true){
			del_result=blogMapper.deleteByPrimaryKey_draftblog(bId);
		}
		return del_result;
	}





	@Override
	public boolean updatereBlogByblog(Blog blog) {
		//取出bId
		int bId=blog.getbId();
		//先提交
		blog.setbId(0);
		boolean update_result=blogMapper.insertSelective_root(blog);
		//删除结果
		boolean del_result=false;
	//提交成功后删除
		if(update_result==true){
			del_result=blogMapper.deleteByPrimaryKey_reblog(bId);
		}
		return del_result;
	}


	@Override
	public boolean updatedraftBlogBybId(int getbId) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean deletedraftBlogBybId(int bId) {
		return blogMapper.deleteByPrimaryKey_draftblog(bId);
	}


	@Override
	public boolean deletereBlogBybId(int bId) {
		return blogMapper.deleteByPrimaryKey_reblog(bId);
	}

	@Override
	public boolean deleteroot_BlogBybId(int bId) {
		return blogMapper.deleteroot_BlogBybId(bId);
	}
	@Override
	public boolean addDraftBlog(Blog draft_blog) {
		return blogMapper.insertSelective_draft_blog(draft_blog);
	}


	@Override
	public int getAllCommentTimes(int uId) {
		return blogMapper.selectAllCommentTimes(uId);
	}


	@Override
	public List<Blog> get_all_users_List() {
		return blogMapper.select_all_users_List();
	}


	@Override
	public List<Blog> get_all_users_rootList() {
		return blogMapper.select_all_users_rootList();
	}

	//审核成功服务
	@Override
	public boolean pending(int bId) {
		Blog blog = null;
		//拿出审核博客
		blog = blogMapper.select_root_blog(bId);
		//删除审核博客
		blogMapper.deleteByPrimaryKey_rootblog(bId);
		//插入到blog
		boolean result = false;
		blog.setbId(0);
		result = blogMapper.insertSelective(blog);
		return result;
	}


	@Override
	public Blog getjudge_contById(int bId) {
		return blogMapper.select_root_blog(bId);
	}


	@Override
	public List<Blog> getHomeListAndcate(Map<String, String> map) {
		return blogMapper.selectHomeListAndcate(map);
	}


	

}
