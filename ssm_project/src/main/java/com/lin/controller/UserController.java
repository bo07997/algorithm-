package com.lin.controller;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.lin.model.User;
import com.lin.service.UserServiceI;
@Controller
@RequestMapping("/User")
public class UserController {

	@Resource
	private UserServiceI userService; 

	@Autowired
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}
/*@RequestMapping(value="/home" ,method=RequestMethod.GET)
public String tohome(){
	return "home";
}*/


	@RequestMapping(value="/UserLogin" ,method=RequestMethod.POST)
	@ResponseBody
	public User getUserByUsername(@RequestBody User u1,HttpServletRequest request,HttpServletResponse response){
		
		User u2=userService.getUserByUsername(u1.getUsername());
		
		if(u2.getPassword().equals(u1.getPassword().trim())){
	   request.getSession().setAttribute("user", u2);
		return u2;
		}
		return null;
	   
	
	}
	

}
