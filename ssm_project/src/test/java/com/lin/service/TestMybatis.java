package com.lin.service;

import java.sql.Date;
import java.util.List;

import javax.enterprise.inject.Model;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.servlet.ModelAndView;

import com.lin.model.Blog;
import com.lin.model.User;
import com.lin.service.UserServiceI;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:application.xml", "classpath:mybatis/mybatis-config.xml" })
public class TestMybatis {

	private static final Logger logger = Logger.getLogger(TestMybatis.class);

	private UserServiceI userService;

	private BlogServiceI blogService;
	
	public UserServiceI getUserService() {
		return userService;
	}
	
	public BlogServiceI getBlogService() {
		return blogService;
	}

	@Autowired
	public void setBlogService(BlogServiceI blogService) {
		this.blogService = blogService;
	}

	@Autowired
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}

	@Test
	public void test1() {
		Blog blog=blogService.getcontById(6);
		System.out.println("--------------------------------------------------");
		System.out.println(blog);
		
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
