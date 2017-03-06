package com.lin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lin.model.MessageInfo;
import com.lin.model.User;
import com.lin.service.MessageInfoServiceI;
import com.lin.service.UserServiceI;
@Controller
@RequestMapping("/MessageInfo")
public class MessageInfoController {

		@Resource
		private MessageInfoServiceI messageInfoService; 

		@Autowired
		public void setUserService(MessageInfoServiceI messageInfoService) {
			this.messageInfoService = messageInfoService;
		}
		
		@RequestMapping(value="/deleteInfo/{Id}" ,method=RequestMethod.GET)
			public String delete(HttpServletRequest request,HttpServletResponse response
					,@PathVariable("Id") int Id){
			 //可能为空待改进
			int uid=0;
			uid=((User)request.getSession().getAttribute("user")).getuId();
				boolean result=messageInfoService.deleteInfoById(Id);
				if(result==true){
					return "redirect:/Message/toMessage/"+uid;
				}
				return "redirect:/Message/toMessage/"+uid;
				}
		
		@RequestMapping(value="/addInfo/{uId}/{type}" ,method=RequestMethod.POST)
		public String addInfo(HttpServletRequest request,HttpServletResponse response
				,@PathVariable("uId") int uId,@PathVariable("type") int type,MessageInfo messageInfo){
			//可能为空待改进
			int uid=0;
			 uid=((User)request.getSession().getAttribute("user")).getuId();
			messageInfo.setType(type);
			messageInfo.setUid(uId);
			boolean result=messageInfoService.addInfo(messageInfo);
			if(result==true){
				return "redirect:/Message/toMessage/"+uid;
			}
			return "redirect:/Message/toMessage/"+uid;
			}
	
}
