package com.lin.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.lin.model.Blog;
import com.lin.model.User;
import com.lin.service.BlogServiceI;
import com.lin.service.UserServiceI;


@Controller
@RequestMapping("/Blog")
public class BlogController {

	@Resource
	private BlogServiceI blogService; 
	@Resource
	private UserServiceI userService;
	@Autowired
	
	public void setBlogService(BlogServiceI blogService) {
		this.blogService = blogService;
	}

	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}


	@RequestMapping(value="/home" ,method=RequestMethod.GET)
	public ModelAndView  tohome(HttpServletRequest request,HttpServletResponse response){
		//通过资源文件获取时间，这里直接写死
		List<Blog> bloglist = blogService.getHomeList("2016-10-10");
		ModelAndView modelAndView=new ModelAndView("home");
		modelAndView.addObject(bloglist);
		return modelAndView;
	}
	 @RequestMapping(value = "/oneblog/{id}")
	    public ModelAndView getcontById(@PathVariable("id") int id) {
	        ModelAndView mode = new ModelAndView("oneblog");
	        Blog blog=blogService.getcontById(id);
	        mode.addObject(blog);//获取博客
	        //以下为获取作者信息
	        User user=userService.getUserById(id);
	        mode.addObject(user);
          return mode;	        
	    }
}
