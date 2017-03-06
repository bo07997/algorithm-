package com.lin.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lin.model.Category;
import com.lin.model.User;
import com.lin.service.BlogServiceI;
import com.lin.service.CategoryServiceI;
import com.lin.service.MessageServiceI;
import com.lin.service.UserServiceI;

@Controller
@RequestMapping("Category")
public class CategoryController {

	@Resource
	private BlogServiceI blogService; 
	@Resource
	private UserServiceI userService;
	@Resource
	private MessageServiceI messageServiceI;
	@Resource
	private CategoryServiceI categoryServiceI;
	@Autowired
	public void setBlogService(BlogServiceI blogService) {
		this.blogService = blogService;
	}

	@Autowired
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}

	@Autowired
	public void setMessageServiceI(MessageServiceI messageServiceI) {
		this.messageServiceI = messageServiceI;
	}

	@Autowired
	public void setCategoryServiceI(CategoryServiceI categoryServiceI) {
		this.categoryServiceI = categoryServiceI;
	}
	//删除分类
	@RequestMapping(value="/deletecate/{cId}" ,method=RequestMethod.POST)
	 @ResponseBody
		public String delete(HttpServletRequest request,HttpServletResponse response
				,@PathVariable("cId") int cId){
			boolean result=categoryServiceI.deletecateById(cId);
			if(result==true){
			return "true";
			}
			return "";
			}
	//修改分类
	@RequestMapping(value="/updatecate/{cId}" ,method=RequestMethod.POST)
	 @ResponseBody
		public Category update(HttpServletRequest request,HttpServletResponse response
				,@PathVariable("cId") int cId, @RequestBody Category category){
		 //可能为空待改进
		int uid=((User)request.getSession().getAttribute("user")).getuId();
		
      
			boolean result=categoryServiceI.updatecateById(category);
			//刷新分类的session
			List<Category>  categories=categoryServiceI.getCateByuId(uid);
			
			if(result==true){
			return category;
			}
			return null;
			}
	
	   //新增分类
		@RequestMapping(value="/addcate/{uId}" ,method=RequestMethod.POST)
		 @ResponseBody
			public String addcate(HttpServletRequest request,HttpServletResponse response
					,@PathVariable("uId") int uId, @RequestBody Category category){
			//1.判断是否已存在相同的类名
			boolean isRepeat=categoryServiceI.isRepeat(category);
			if(isRepeat) return "";
			//初始化类别
			category.setCreateDate(new Date());
				boolean result=categoryServiceI.addCate(category);
				
				
				if(result==true){
				return "1";
				}
				return "";
				}
	
}
