package com.lin.controller;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.lin.model.Blog;
import com.lin.model.Message;
import com.lin.model.User;
import com.lin.model.v2model.Root_message;
import com.lin.service.BlogServiceI;
import com.lin.service.MessageServiceI;
import com.lin.service.UserServiceI;
@Controller
@RequestMapping("/User")
public class UserController {

	@Resource
	private UserServiceI userService; 

	@Resource
	private MessageServiceI messageServiceI;
	
	@Resource
	private BlogServiceI blogService; 
	@Autowired
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}
	@Autowired
	public void setMessageServiceI(MessageServiceI messageServiceI) {
		this.messageServiceI = messageServiceI;
	}
	@Autowired
	public void setBlogService(BlogServiceI blogService) {
		this.blogService = blogService;
	}
/*@RequestMapping(value="/home" ,method=RequestMethod.GET)
public String tohome(){
	return "home";
}*/


	@RequestMapping(value="/UserLogin" ,method=RequestMethod.POST)
	@ResponseBody
	public User getUserByUsername(@RequestBody User u1,HttpServletRequest request,HttpServletResponse response){
		User u2=null;
		try {
			u2=userService.getUserByUser(u1);
		} catch (Exception e) {
		}
		
		
		if(u1.getPassword().trim().equals(u2.getPassword().trim())&&u2!=null){
	   request.getSession().setAttribute("user", u2);
	   if(u2.getRootAuth()==1){
		   //放入管理员信息
	   request.getSession().setAttribute("loginroot", u2);
	   }
	   else{
		 //放入个人信息
		   Message message=messageServiceI.getMessageById(u2.getMessageid());
		   request.getSession().setAttribute("login_message", message);
		   request.getSession().setAttribute("loginuser", u2);
	   }
		return u2;
		}
		return null;
	   
	
	}
	//注销用户
	@RequestMapping(value="/loginout " ,method=RequestMethod.GET)
	public String loginoutUser( 
			HttpServletRequest request,HttpServletResponse response){
		request.getSession().removeAttribute("loginuser");
		request.getSession().removeAttribute("login_message");
		return "redirect:/";
	}
	
	/*
	 * AJAX异步验证用户名是否重复
	 */
	@RequestMapping(value="/UserRegister" ,method=RequestMethod.POST)
	@ResponseBody
	public boolean validateUsername(@RequestBody Map<String, String>  username,HttpServletRequest request,HttpServletResponse response){
		boolean result=false;
		 result=userService.validateUsername(username.get("username"));
		
		return result;
	   
	
	}
	
	@RequestMapping(value="/insertUser " ,method=RequestMethod.POST)
	public String insertUser (User  user,HttpServletRequest request,HttpServletResponse response){
		//插入用户
		boolean result=userService.insertUser( user);
		boolean result2=false;
	   //插入成功就设置分类ID
		if(result==true){
		   int uid=userService.getUserByUsername(user.getUsername()).getuId();
		  
		   result2=userService.updateMid(uid);
	   }
	
		return "redirect:/";
	}
	/*
	 * 以下是管理员部分
	 */
	@RequestMapping(value="/root " ,method=RequestMethod.GET)
	public String toroot (HttpServletRequest request,HttpServletResponse response){
		
	
		return "root/Root_login_success";
	}
	
	//查询全部博客
	@RequestMapping(value="/root/all_blog/{page} " ,method=RequestMethod.GET)
	public ModelAndView all_blog(@PathVariable("page") int page,
			HttpServletRequest request,HttpServletResponse response){
		ModelAndView modelAndView=new ModelAndView("root/blog/all_blog");
		List<Blog> blogs_root = null;
		blogs_root = blogService.get_all_users_List();
		//插入全部博客
		modelAndView.addObject("blogs_root",blogs_root);
	
		return modelAndView;
	}
	    //查询待审核博客
		@RequestMapping(value="/root/all_root_blog " ,method=RequestMethod.GET)
		public ModelAndView all_root_blog(
				HttpServletRequest request,HttpServletResponse response){
			ModelAndView modelAndView=new ModelAndView("root/blog/all_root_blog");
			List<Blog> blogs_root_rootblog = null;
			blogs_root_rootblog = blogService.get_all_users_rootList();
			//插入全部博客
			modelAndView.addObject("blogs_root_rootblog",blogs_root_rootblog);
			return modelAndView;
		}
	        	//查询所有用户
				@RequestMapping(value="/root/all_user " ,method=RequestMethod.GET)
				public ModelAndView all_user(
						HttpServletRequest request,HttpServletResponse response){
					ModelAndView modelAndView=new ModelAndView("root/account/all_user");
					
					List<Map<Object, Object> > users= null;
					//查询全部用户
					users =userService.getAlluser_message();
					//插入全部用户
					modelAndView.addObject("root_users_messages",users);
					return modelAndView;
				}
				//删除用户
				@RequestMapping(value="/root/deleteuser/{uId}  " ,method=RequestMethod.GET)
				@ResponseBody
				public boolean deleteuser(@PathVariable("uId") int uId,
						HttpServletRequest request,HttpServletResponse response){
					//删除用户
					boolean result =userService.deleteuser(uId);
					return result;
				}
				//提升用户为管理员
				@RequestMapping(value="/root/beManager/{uId}  " ,method=RequestMethod.GET)
				@ResponseBody
				public boolean beManager(@PathVariable("uId") int uId,
						HttpServletRequest request,HttpServletResponse response){
					//删除用户
					User user =new User();
					user.setuId(uId);
					user.setRootAuth(1);
					boolean result =userService.beManager(user);
					return result;
				}
				//查询所有管理员
				@RequestMapping(value="/root/all_root " ,method=RequestMethod.GET)
				public ModelAndView all_root(
						HttpServletRequest request,HttpServletResponse response){
					ModelAndView modelAndView=new ModelAndView("root/account/all_root");
					
					List<Map<Object, Object> > roots= null;
					//查询全部用户
					roots =userService.getAllroot_message();
					//插入全部用户
					modelAndView.addObject("root_roots_messages",roots);
					return modelAndView;
				}
				//删除管理员
				@RequestMapping(value="/root/deleteroot/{uId}  " ,method=RequestMethod.GET)
				@ResponseBody
				public boolean deleteroot(@PathVariable("uId") int uId,
						HttpServletRequest request,HttpServletResponse response){
					//删除管理员
					boolean result =userService.deleteuser(uId);
					return result;
				}
				//更新管理员
				@RequestMapping(value="/root/update_root " ,method=RequestMethod.POST)
				public String update_root( Root_message root_message,
						HttpServletRequest request,HttpServletResponse response){
					//初始化管理员权限
					root_message.getUser().setRootAuth(1);
					//更新管理员及其信息
					boolean result = userService.update_root(root_message);
					return "redirect:all_root";
				}
				//注销管理员
				@RequestMapping(value="/root/loginout " ,method=RequestMethod.GET)
				public String loginout( 
						HttpServletRequest request,HttpServletResponse response){
					request.getSession().removeAttribute("loginroot");
					return "redirect:/";
				}
}
