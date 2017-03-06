package com.lin.service;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.lin.model.Blog;
import com.lin.model.Category;
import com.lin.model.Comment;
import com.lin.model.Message;
import com.lin.model.User;
import com.lin.model.v2model.Blogv2;
import com.lin.model.v2model.Comment_Blog_User;
import com.lin.model.v2model.Comment_message;
import com.lin.service.UserServiceI;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:application.xml", "classpath:mybatis/mybatis-config.xml" })
public class TestMybatis {

	private static final Logger logger = Logger.getLogger(TestMybatis.class);

	private UserServiceI userService;

	private BlogServiceI blogService;
	
	private CategoryServiceI categoryServiceI;
	
	private MessageServiceI messageService;
	
	
	private CommentServiceI CommentService; 

	@Autowired
	public void setCommentService(CommentServiceI CommentService) {
		this.CommentService = CommentService;
	}

	@Autowired
	public void setCategoryServiceI(CategoryServiceI categoryServiceI) {
		this.categoryServiceI = categoryServiceI;
	}

	@Autowired
	public void setBlogService(BlogServiceI blogService) {
		this.blogService = blogService;
	}

	@Autowired
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}
	@Autowired
	public void setMessageService(MessageServiceI messageService) {
		this.messageService = messageService;
	}

	@SuppressWarnings("null")
	@Test
	public void test1() {
		List<Blog> blogs = null;
		Map<String, String> map =new HashMap<>();
		map.put("time", "2016-10-10");
		map.put("csdn_cate", "综合");
		blogs= blogService.getHomeListAndcate(map);
		System.out.println();
	}
	@Test
	public void test2() {
		/*List<Blogv2> list=blogService.getMapList(1);
		System.out.println(list.toString());
		
		 boolean categories=categoryServiceI.deletecateById(26);
		 System.out.println(categories);*/
		
	}
	
	
	
	
	/*@Test
	public void test2() {
		List<User> l = userService.getAll();
		logger.info(JSON.toJSONStringWithDateFormat(l, "yyyy-MM-dd HH:mm:ss"));
	}

	@Test
	public void test3() {
		List<User> l = userService.getAll2();
		logger.info(JSON.toJSONStringWithDateFormat(l, "yyyy-MM-dd HH:mm:ss"));
	}

	@Test
	public void test4() {
		List<User> l = userService.getAll3();
		logger.info(JSON.toJSONStringWithDateFormat(l, "yyyy-MM-dd HH:mm:ss"));
	}*/
}
