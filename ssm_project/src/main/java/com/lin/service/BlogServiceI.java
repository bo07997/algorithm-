package com.lin.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.lin.model.Blog;
import com.lin.model.v2model.Blog_table;
import com.lin.model.v2model.Blogv2;

public interface BlogServiceI {

	//选择某个时间段之后的数据
	public List<Blog> getHomeList(String date);
	
	public Blog getcontById(int id);
	//根据年月来分类文章,通过uId
	public  List<Blogv2> getMapList(int uId);
	//阅读排行获取,包括阅读次数，博客标题，博客Id
	public List<Blog> getreadTimesList(int uid);
	//评论排行获取,包括评论次数，博客标题，博客Id
	public List<Blog> getreadcommonsList(int uid);
	//通过ID获取所有博客
	public List<Blog> getallList(int uid);

	//通过分类和id来获取bloglist，0为全部
	public List<Blog> getcateList(Map<String, Integer> catemap);

	//通过用户id来获取草稿箱博客列表
	public List<Blog> getreblogList(int uId);

	public List<Blog> getdraftblogList(int uId);

	public boolean deleteBlogBybId(int bId);

	public List<Blog> getblogsByDate(Map<String, String> catemap);

	public boolean addNewBlog(Blog new_blog);

	public boolean updateBlog(Blog new_blog);

	public boolean updatecateById(Blog_table blog_table);

	public boolean updatecommonauth(Blog_table blog_table);

	public Blog getcontByMap(Map<String, Object> blogmap);

	public boolean updatedraftBlogBybId(int getbId);

	public boolean updatedraftBlogByblog(Blog new_blog);

	public boolean updatereBlogByblog(Blog new_blog);

	public boolean deletedraftBlogBybId(int bId);

	public boolean deletereBlogBybId(int bId);
	
	//删除待审核博客
		public boolean deleteroot_BlogBybId(int bId);

	public boolean addDraftBlog(Blog draft_blog);

	//获取总评论次数
	public int getAllCommentTimes(int uId);

	//获取全部博客
	public List<Blog> get_all_users_List();

	//获取待审核博客
	public List<Blog> get_all_users_rootList();

	//审核成功服务
	public boolean pending(int bId);
	//审核时查看博客
	public Blog getjudge_contById(int bId);

	//按类别，时间查看主页博客
	public List<Blog> getHomeListAndcate(Map<String, String> map);

	

	
	
}