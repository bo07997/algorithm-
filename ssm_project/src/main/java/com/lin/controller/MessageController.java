package com.lin.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lin.model.Blog;
import com.lin.model.Category;
import com.lin.model.Message;
import com.lin.model.User;
import com.lin.model.MessageV2.UpdateM;
import com.lin.model.v2model.Amodel;
import com.lin.model.v2model.Blogv2;
import com.lin.model.v2model.Comment_Blog_User;
import com.lin.service.BlogServiceI;
import com.lin.service.CategoryServiceI;
import com.lin.service.CommentServiceI;
import com.lin.service.MessageServiceI;
import com.lin.service.UserServiceI;

@Controller
@RequestMapping("/Message")
public class MessageController {
	
	@Resource
	private BlogServiceI blogService; 
	@Resource
	private UserServiceI userService;
	@Resource
	private MessageServiceI messageServiceI;
	@Resource
	private CategoryServiceI categoryServiceI;
	@Resource
	private CommentServiceI commentService; 

	
	
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
	@Autowired
	public void setCommentService(CommentServiceI commentService) {
		this.commentService = commentService;
	}
	
	
	 @RequestMapping(value = "/our_home/{id}_{cId}")
	    public ModelAndView to_our_home(@PathVariable("id") int id,HttpServletRequest request,
	    		HttpServletResponse response,@PathVariable("cId") int cId) {
		
	        ModelAndView mode = new ModelAndView("our_home");
	        //查询获取总评论次数
	        int all_comment_times = blogService.getAllCommentTimes(id);
	        mode.addObject("all_comment_times",all_comment_times);
	        //博客列表
			 List<Blog> blogs=null;
			 mode.addObject("id",id);
			 mode.addObject("auth_id",id);
			 if(cId==0){
				 blogs=blogService.getallList(id);
			     mode.addObject("blogs",blogs);
			}
			else{
			Map<String,Integer> catemap=new HashMap<>();
			catemap.put("uId", id);
			catemap.put("cId", cId);
			 blogs=blogService.getcateList(catemap);
			mode.addObject("blogs",blogs);
			}
	 
	      
	        //以下为获取作者基本信息
	        User user=userService.getUserById(id);
	        mode.addObject("user",user);
	        //以下获取作者具体信息
	        Message message=messageServiceI.getMessageById(user.getMessageid());
	        mode.addObject("message",message);
	        /*
	         * 以下获取左边专栏信息
	         */
	        //分类获取
	        List<Category> categories=categoryServiceI.getCateByuId(id);
	        mode.addObject("categories",categories);
	        //存档时间获取 ,使用新建实体类来接收数据
	        List<Blogv2> createD=blogService.getMapList(id);
	        mode.addObject("createD",createD);
	        
	        //阅读排行，用Blog来接收，其它为null
	        List<Blog> readTimes=blogService.getreadTimesList(id);
	        mode.addObject("readTimes",readTimes);
	        //评论排行，用Blog来接收，其它为null
	        List<Blog> commontTimes=blogService.getreadcommonsList(id);
	        mode.addObject("commontTimes",commontTimes);
          return mode;	        
	 
	    }
	 
	 @RequestMapping(value = "/manager/{id}/{managercate}_{cId}")
	    public ModelAndView to_our_manager(@PathVariable("id") int id,@PathVariable("managercate") int managercate,
	    		@PathVariable("cId") int cId,HttpServletRequest request,
	    		HttpServletResponse response) {
			//验证登录
		 User judge_user=null;
		 judge_user= ((User)request.getSession().getAttribute("loginuser"));
		 if(judge_user==null)//未登录
		 {
			 ModelAndView mode_end = new ModelAndView("unlogin");
			 return mode_end;
		 }
		 ModelAndView mode = new ModelAndView("manager");
		 mode.addObject("cId",cId);
		 mode.addObject("id",id);
		 mode.addObject("managercate",managercate);
		 //博客列表
		 List<Blog> blogs=null;
		 //分类
		 List<Category> categories=null;
		//获取作者基本信息
	        User user=userService.getUserById(id);
	        mode.addObject("user",user);
		 //获取用户具体信息
		 Message message=messageServiceI.getMessageById(id);
		 mode.addObject("message",message);
		 //分类获取
	        categories=categoryServiceI.getCateByuId(id);
	        mode.addObject("categories",categories);
		 switch (managercate) {
		 
		case 1:
			if(cId==0){
				 blogs=blogService.getallList(id);
			     mode.addObject("blogs",blogs);
			}
			else{
			Map<String,Integer> catemap=new HashMap<>();
			catemap.put("uId", id);
			catemap.put("cId", cId);
			 blogs=blogService.getcateList(catemap);
			mode.addObject("blogs",blogs);
			}
			
			break;
		case 2:
		
			break;
		case 3:
			//评论
			List<Comment_Blog_User> comment_Blog_Users=null;
			if(cId==0){
				//获取某一博主的所有博客下的评论
			comment_Blog_Users = commentService.getAllComment(id);
			}
			if(cId==1){
				//获取某一博主发表过的所有评论
				comment_Blog_Users = commentService.getMyComment(id);
			}
			mode.addObject("comment_Blog_Users",comment_Blog_Users);
			break;
		case 4:
			 blogs=blogService.getdraftblogList(id);
		     mode.addObject("blogs",blogs);
			break;
		case 5:
			blogs=blogService.getreblogList(id);
		     mode.addObject("blogs",blogs);
			break;
         case 6:
			
			break;
		}
		 
		 
		 return mode;
	 }
	 
	 /*
	  * ajax请求处理，年月查找博文
	  * */
	 @RequestMapping(value="/cateByDate",method=RequestMethod.POST)
	 @ResponseBody 
	 public List<Blog> getblogsByDate(@RequestBody Amodel amodel){
		 List<Blog> blogs=null;
		 Map<String,String> catemap=new HashMap<>();
			catemap.put("uId", String.valueOf(amodel.getuId()));
			catemap.put("date", amodel.getDate());
			 blogs= blogService.getblogsByDate(catemap);
			 return blogs;
	 }
	 
	 @RequestMapping(value="/toMessage/{messageId}")
	 public ModelAndView toMessage(@PathVariable("messageId") int  messageId,
			 HttpServletRequest request,HttpServletResponse response){
//获取user
	int uid=0;
	User judge_user=null;
	judge_user=	((User)request.getSession().getAttribute("loginuser"));
	if (judge_user!=null) {
		uid=judge_user.getuId();
	}
		//判断是否为本人
	int update_Info_auth=0;
	if(uid==messageId){
		update_Info_auth=1;
	}
	
		 Message message= messageServiceI.getMessageById(messageId);
		 ModelAndView mode = new ModelAndView("message");
		 //放入权限
		 mode.addObject("update_Info_auth",update_Info_auth);
		 //转换为直接可用数据
		 if(!"".equals(message.getHangye().trim())&&message.getHangye()!=null){
		 mode.addObject("hangye_myinfo",message.getHangye());
		 }else{
			 mode.addObject("hangye_myinfo","未填写行业");
		 }
		 
		 if(!"".equals(message.getJob().trim())&&message.getJob()!=null){
		 mode.addObject("job_myinfo",message.getJob());
		 }else{
			 mode.addObject("job_myinfo","未填写职位");
		 }
		 if(!"".equals(message.getRealname().trim())&&message.getRealname()!=null){
		 mode.addObject("realname_myinfo",message.getRealname());
		 }else{
			 mode.addObject("realname_myinfo","未填写姓名");
		 }
		 if(!"".equals(message.getNationality().trim())&&message.getNationality()!=null){
		 mode.addObject("nationality_myinfo",message.getNationality());
		 }else{
			 mode.addObject("nationality_myinfo","未填写国籍");
		 }
		 if(message.getSex()!=0){
			 if(message.getSex()==1){
		 mode.addObject("sex_myinfo","男");
			 }else{
				 mode.addObject("sex_myinfo","女");
			 }
		 }else{
			 mode.addObject("sex_myinfo","未填写性别");
		 }
		 if(message.getBirthday()!=null){
			  DateFormat  df  = new SimpleDateFormat("yyyy年MM月dd日");
			  DateFormat  df2  = new SimpleDateFormat("yyyy-MM-dd");
			  mode.addObject("birthday_str",df2.format(message.getBirthday()));
			  mode.addObject("birthday_myinfo",df.format(message.getBirthday()));
			  
		 }else{
			 mode.addObject("birthday_myinfo","未填写生日");
		 }
		 
		 //技能,领域
		  List<Map<Object, Object>> skillAndFields= userService.findskill(messageId);
		 mode.addObject("skillAndFields",skillAndFields);
		 
		 mode.addObject("message_Info_all",message);
		 return mode;
	 }
	 
	 @SuppressWarnings("deprecation")
	@RequestMapping(value = "/updateMessage/{messageId}")
	    public String getcontById(@PathVariable("messageId") int  messageId, UpdateM message,
	    		HttpServletRequest request,HttpServletResponse response) {
		 //可能为空待改进
			int uid=((User)request.getSession().getAttribute("user")).getuId();
			//设置信息ID，方便更新
			message.getMessage().setMessageId(uid);
			 //处理时间
			if(message.getBirthday_str()!=null&&!"".equals(message.getBirthday_str().trim())){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
			Date date = null;
			try {
				date = sdf.parse(message.getBirthday_str());
			} catch (ParseException e) {
				e.printStackTrace();
			}  
		 message.getMessage().setBirthday(date);
			}
		 
		 //更新用户名，如果不为空
		 if (message.getUsername()!=null&&!"".equals(message.getUsername().trim())) {
			 User user=new User();
			 user.setuId(uid);
			 user.setUsername(message.getUsername());
			 userService.updateByPrimaryKeySelective(user);
			
		}
		 //更新Message表数据
		 messageServiceI.updateByPrimaryKeySelective(message.getMessage());
		 
		 return "redirect:/Message/toMessage/"+uid;
	 }
}
