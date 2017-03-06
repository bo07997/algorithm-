package com.lin.controller;

import java.text.DateFormat;
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
import com.lin.model.ReadIp;
import com.lin.model.UpIp;
import com.lin.model.User;
import com.lin.model.v2model.Blog_table;
import com.lin.model.v2model.Blogv2;
import com.lin.service.BlogServiceI;
import com.lin.service.CategoryServiceI;
import com.lin.service.MessageServiceI;
import com.lin.service.Up_read_timesServicesI;
import com.lin.service.UserServiceI;


@Controller
@RequestMapping("/Blog")
public class BlogController {

	@Resource
	private BlogServiceI blogService; 
	@Resource
	private UserServiceI userService;
	@Resource
	private MessageServiceI messageServiceI;
	@Resource
	private CategoryServiceI categoryServiceI;
	@Resource
	private Up_read_timesServicesI up_read_timesServicesI;
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
	public void setUp_read_timesServicesI(Up_read_timesServicesI up_read_timesServicesI) {
		this.up_read_timesServicesI = up_read_timesServicesI;
	}

	//主页action
	@RequestMapping(value="/home" ,method=RequestMethod.GET)
	public ModelAndView  tohome(HttpServletRequest request,HttpServletResponse response){
		//通过资源文件获取时间，这里直接写死
		List<Blog> bloglist = blogService.getHomeList("2016-10-10");
		ModelAndView modelAndView=new ModelAndView("home");
		modelAndView.addObject("bloglist",bloglist);
		User user=null;
		user =(User) request.getSession().getAttribute("user");
		//获取博客通过ID,图片推荐   ...................这里加个错误处理
		   Blog blog=blogService.getcontById(1 );
	        DateFormat  df  = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	        blog.setDayChinese(df.format(blog.getCreateDate()));
	        modelAndView.addObject("blog",blog);
	        //获取博客首页介绍人物信息
	        Message homeman=messageServiceI.getMessageById(1);
	        modelAndView.addObject("homeman",homeman);
		return modelAndView;
	}
	//主页action,带类别的
		@RequestMapping(value="/home/{csdn_cate}" ,method=RequestMethod.GET)
		public ModelAndView  tohome_cate(@PathVariable("csdn_cate") String csdn_cate,
				HttpServletRequest request,HttpServletResponse response){
			Map<String, String> map =new HashMap<>();
			//通过资源文件获取时间，这里直接写死
			map.put("time", "2016-10-10");
			map.put("csdn_cate", csdn_cate);
			
			List<Blog> bloglist = blogService.getHomeListAndcate(map);
			ModelAndView modelAndView=new ModelAndView("home");
			modelAndView.addObject("bloglist",bloglist);
			User user=null;
			user =(User) request.getSession().getAttribute("user");
			//获取博客通过ID,图片推荐   ...................这里加个错误处理
			   Blog blog=blogService.getcontById(1 );
		        DateFormat  df  = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		        blog.setDayChinese(df.format(blog.getCreateDate()));
		        modelAndView.addObject("blog",blog);
		        //获取博客首页介绍人物信息
		        Message homeman=messageServiceI.getMessageById(1);
		        modelAndView.addObject("homeman",homeman);
			return modelAndView;
		}
	//查看具体某个博客，通过bId
	 @RequestMapping(value = "/oneblog/{bId}")
	    public ModelAndView getcontById(@PathVariable("bId") int bId,
	    		HttpServletRequest request,HttpServletResponse response) {
	        ModelAndView mode = new ModelAndView("oneblog");
	   	 //可能为空待改进,获取用户登录信息
	    	Message login_message=((Message)request.getSession().getAttribute("login_message"));
	    	mode.addObject("login_message_oneblog",login_message);
	        
	      //获取博客通过ID
	        Blog blog=blogService.getcontById(bId);
	        DateFormat  df  = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	        blog.setDayChinese(df.format(blog.getCreateDate()));
	        mode.addObject("blog",blog);
	        //查询获取总评论次数
	        int all_comment_times = blogService.getAllCommentTimes(blog.getuId());
	        mode.addObject("all_comment_times",all_comment_times);
	        //以下为获取作者基本信息
	        User user=userService.getUserById(blog.getuId());
	        mode.addObject("user",user);
	        //以下获取作者具体信息
	        Message message=messageServiceI.getMessageById(user.getMessageid());
	        mode.addObject("message",message);
	        /*
	         * 以下获取左边专栏信息
	         */
	        //分类获取
	        List<Category> categories=categoryServiceI.getCateByuId(blog.getuId());
	        mode.addObject("categories",categories);
	        //存档时间获取 ,使用新建实体类来接收数据
	        List<Blogv2> createD=blogService.getMapList(blog.getuId());
	        mode.addObject("createD",createD);
	        
	        //阅读排行，用Blog来接收，其它为null
	        List<Blog> readTimes=blogService.getreadTimesList(blog.getuId());
	        mode.addObject("readTimes",readTimes);
	        //评论排行，用Blog来接收，其它为null
	        List<Blog> commontTimes=blogService.getreadcommonsList(blog.getuId());
	        mode.addObject("commontTimes",commontTimes);
	        /*
	         * 最后统计阅读人次
	         */
	        //初始化查询条件
	        ReadIp readIp = new ReadIp();
	        //初始化查询结果
	        ReadIp result = null;
	        //博客ID
	        readIp.setbId(bId);
	        //IP地址
	        readIp.setIp(up_read_timesServicesI.getRemoteHost(request));
	        //查询是否重复，返回一个对象
	        result = up_read_timesServicesI.getcountByReadIp(readIp);
	        //如果是第一次访问
	        if(result==null){
	        	//更新博客访问记录
	        	blog.setReadTimes(blog.getReadTimes()+1);
	        	blogService.updateBlog(blog);
	        	//更新IP记录
	        	up_read_timesServicesI.addReadIp(readIp);
	        }
          return mode;	        
	    }
		//查看具体某个博客，通过bId,博客审核时单独用
	 @RequestMapping(value = "/oneblog_judge/{bId}")
	    public ModelAndView getjudge_contById(@PathVariable("bId") int bId,
	    		HttpServletRequest request,HttpServletResponse response) {
	        ModelAndView mode = new ModelAndView("oneblog_judge");
	   	 //可能为空待改进,获取用户登录信息
	    	Message login_message=((Message)request.getSession().getAttribute("login_message"));
	    	mode.addObject("login_message_oneblog",login_message);
	        
	      //获取博客通过ID
	        Blog blog=blogService.getjudge_contById(bId);
	        DateFormat  df  = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	        blog.setDayChinese(df.format(blog.getCreateDate()));
	        mode.addObject("blog",blog);
	        //查询获取总评论次数
	        int all_comment_times = blogService.getAllCommentTimes(blog.getuId());
	        mode.addObject("all_comment_times",all_comment_times);
	        //以下为获取作者基本信息
	        User user=userService.getUserById(blog.getuId());
	        mode.addObject("user",user);
	        //以下获取作者具体信息
	        Message message=messageServiceI.getMessageById(user.getMessageid());
	        mode.addObject("message",message);
	        /*
	         * 以下获取左边专栏信息
	         */
	        //分类获取
	        List<Category> categories=categoryServiceI.getCateByuId(blog.getuId());
	        mode.addObject("categories",categories);
	        //存档时间获取 ,使用新建实体类来接收数据
	        List<Blogv2> createD=blogService.getMapList(blog.getuId());
	        mode.addObject("createD",createD);
	        
	        //阅读排行，用Blog来接收，其它为null
	        List<Blog> readTimes=blogService.getreadTimesList(blog.getuId());
	        mode.addObject("readTimes",readTimes);
	        //评论排行，用Blog来接收，其它为null
	        List<Blog> commontTimes=blogService.getreadcommonsList(blog.getuId());
	        mode.addObject("commontTimes",commontTimes);
	        /*
	         * 最后统计阅读人次
	         */
	        //初始化查询条件
	        ReadIp readIp = new ReadIp();
	        //初始化查询结果
	        ReadIp result = null;
	        //博客ID
	        readIp.setbId(bId);
	        //IP地址
	        readIp.setIp(up_read_timesServicesI.getRemoteHost(request));
	        //查询是否重复，返回一个对象
	        result = up_read_timesServicesI.getcountByReadIp(readIp);
	        //如果是第一次访问
	        if(result==null){
	        	//更新博客访问记录
	        	blog.setReadTimes(blog.getReadTimes()+1);
	        	blogService.updateBlog(blog);
	        	//更新IP记录
	        	up_read_timesServicesI.addReadIp(readIp);
	        }
          return mode;	        
	    }
	 //删除博客通过bId
	 @RequestMapping(value="/deleteblog/{table}/{bId}" ,method=RequestMethod.POST)
	 @ResponseBody
		public String delete(HttpServletRequest request,HttpServletResponse response
				,@PathVariable("table") String table	,@PathVariable("bId") int bId){
		 
			boolean result=false;
			        //如果是blog表
					if(table.equals("blog")){
			              result=blogService.deleteBlogBybId(bId);
					}
					//如果是草稿箱
					if(table.equals("draftblog")){
						result=blogService.deletedraftBlogBybId(bId);
					}
					//如果是回收站
					if(table.equals("reblog")){
						result=blogService.deletereBlogBybId(bId);
					}
					//如果是待审核
					if(table.equals("root_blog")){
						result=blogService.deleteroot_BlogBybId(bId);
					}
			
			//结果
			if(result==true){
			return "true";
			}
			return "";
			}
	 
	 //去到uediter写博客
	 @RequestMapping(value="/writeblog/{uId}" ,method=RequestMethod.GET)
		public ModelAndView write(HttpServletRequest request,HttpServletResponse response
				,@PathVariable("uId") int uId){
		//验证登录
		 User judge_user=null;
		 judge_user= ((User)request.getSession().getAttribute("loginuser"));
		 if(judge_user==null)//未登录
		 {
			 ModelAndView mode_end = new ModelAndView("unlogin");
			 return mode_end;
		 }
		 ModelAndView mode = new ModelAndView("uediter/u_editer");
		 mode.addObject("uId",uId);
		 //分类获取
		 //分类
		  List<Category> categories=null;
	        categories=categoryServiceI.getCateByuId(uId);
	        mode.addObject("categories",categories);
	        
	        
		 return mode;
	 }
	 //提交新博客到root
	    @RequestMapping(value="/addBlogByUser" ,method=RequestMethod.POST)
		@ResponseBody
		public Blog addBlogByUser(@RequestBody Blog new_blog,HttpServletRequest request,
				HttpServletResponse response){
	    	//设置时间
	    	 DateFormat  df  = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    	 new_blog.setDayChinese(df.format(new Date()));
		     new_blog.setCreateDate(new Date());
		   //设置评论权限，默认为FALSE
		     new_blog.setCommontAuth(false);
		     //设置主页权限，默认FALSE
		     new_blog.setHomeBlog(false);
		  boolean result=   blogService.addNewBlog(new_blog);
		     
		     
		     if(result==true){
		 		   return new_blog;
		 		     }
		 		     return null;
		
		}
	    
	    //保存博客到草稿箱
	    @RequestMapping(value="/addDraftBlogByUser" ,method=RequestMethod.POST)
		@ResponseBody
		public Blog preserveBlog(@RequestBody Blog draft_blog,HttpServletRequest request,
				HttpServletResponse response){
	    	//设置时间
	    	 DateFormat  df  = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    	 draft_blog.setDayChinese(df.format(new Date()));
	    	 draft_blog.setCreateDate(new Date());
		   //设置评论权限，默认为FALSE
	    	 draft_blog.setCommontAuth(false);
		     //设置主页权限，默认FALSE
	    	 draft_blog.setHomeBlog(false);
		  boolean result=   blogService.addDraftBlog(draft_blog);
		     
		     
		     if(result==true){
		 		   return draft_blog;
		 		     }
		 		     return null;
		
		}
	    //提交编辑
	    @RequestMapping(value="/updateBlogByUser" ,method=RequestMethod.POST)
	 		@ResponseBody
	 		public Blog updateBlogByUser(@RequestBody Blog new_blog,HttpServletRequest request,
	 				HttpServletResponse response){
	    	//获取编辑的bId并且设置
	    	Blog blog=(Blog) request.getSession().getAttribute("update_blog");
	    	//获取表
	    	String table=(String) request.getSession().getAttribute("update_table");
	       
	    	//初始化
	    	new_blog.setbId(blog.getbId());
	 	    	//设置时间
	 	    	 DateFormat  df  = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	 	    	 new_blog.setDayChinese(df.format(new Date()));
	 		     new_blog.setCreateDate(new Date());
	 		   //设置评论权限，默认为FALSE
	 		     new_blog.setCommontAuth(false);
	 		     //设置主页权限，默认FALSE
	 		     new_blog.setHomeBlog(false);
	 		    boolean update_result=false;
	 		     //如果是草稿箱里面的
	 	    	if(table.equals("draftblog")){
	 	    		//提交到root_blog并且在业务层删除
	 	    		update_result=blogService.updatedraftBlogByblog(new_blog);
	 	    	}
	 	       //如果是回收站里面的
	 	    	if(table.equals("reblog")){
	 	    		//提交到root_blog并且在业务层删除
	 	    		update_result=blogService.updatereBlogByblog(new_blog);
	 	    	}
	 	    	//最后如果是blog直接update
	 	    	if(table.equals("blog")){
	 	    		update_result=    blogService.updateBlog(new_blog);
	 	    	}
	 	    	
	 	    	
	 	    	//结果返回
	 		     if(update_result==true){
	 		   return new_blog;
	 		     }
	 		     return null;
	 		     
	 		
	 		}
	    //去到uediter编辑已存在博客
		 @RequestMapping(value="/postedit/{table}/{bId}" ,method=RequestMethod.GET)
			public ModelAndView updateblog(HttpServletRequest request,HttpServletResponse response
					,@PathVariable("table") String table	,@PathVariable("bId") int bId){
			 
				//验证登录
			 User judge_user=null;
			 judge_user= ((User)request.getSession().getAttribute("loginuser"));
			 if(judge_user==null)//未登录
			 {
				 ModelAndView mode_end = new ModelAndView("unlogin");
				 return mode_end;
			 }
			 Map<String,Object> blogmap=new HashMap<>();
			 ModelAndView mode = new ModelAndView("uediter/updateInUedite");
			 blogmap.put("bId", bId);
			 blogmap.put("table", table);
			 
			 Blog update_blog=blogService.getcontByMap(blogmap);
			 mode.addObject("update_blog",update_blog);
			 //放进request
			    request.getSession().setAttribute("update_blog", update_blog);
			    request.getSession().setAttribute("update_table", table);
			 //分类获取
			 //分类
			  List<Category> updateBlog_categories=null;
			  updateBlog_categories=categoryServiceI.getCateByuId(update_blog.getuId());
		        mode.addObject("updateBlog_categories",updateBlog_categories);
		        
		    
		        
			 return mode;
		 }
		 //ajax请求获取CSDN分类的选中
		   @RequestMapping(value="/getCSDNradio" ,method=RequestMethod.POST)
			@ResponseBody
			public Blog getradio(HttpServletRequest request,
					HttpServletResponse response){
			   Blog blog=(Blog) request.getSession().getAttribute("update_blog");
			     
			     
			   return blog;
			
			}
		 //修改博客所属分类
			@RequestMapping(value="/updatecate/{bId}" ,method=RequestMethod.POST)
			 @ResponseBody
				public String update(HttpServletRequest request,HttpServletResponse response
						,@PathVariable("bId") int bId, @RequestBody Blog_table blog_table){
				
					boolean result=blogService.updatecateById(blog_table);
					if(result==true){
					return "true";
					}
					return "";
					}
			
			 //修改博客评论权限
			@RequestMapping(value="/setcommonauth/{bId}" ,method=RequestMethod.POST)
			 @ResponseBody
				public String updatecommonauth(HttpServletRequest request,HttpServletResponse response
						,@PathVariable("bId") int bId,@RequestBody Blog_table blog_table ){
				
				
				//更改权限
				blog_table.setCommontAuth(!blog_table.getCommontAuth());
				
					boolean result=blogService.updatecommonauth(blog_table);
					if(result==true){
					return "true";
					}
					return "";
					}
			 //修改博客的赞和踩,不能并发---!!!!!!!!
			@RequestMapping(value="/updateUp_down/{up_down}" ,method=RequestMethod.POST)
			 @ResponseBody
				public Blog updateUp_down(HttpServletRequest request,HttpServletResponse response
						,@PathVariable("up_down") int up_down	,@RequestBody UpIp upIp){
			    
				//临时对象
				Blog blog=null;
				//获取IP，并且赋值
				   String ip= null;
					ip=	up_read_timesServicesI.getRemoteHost(request);
					upIp.setIp(ip);
					//查询该IP是否有点赞记录
					UpIp result=null;
					result = up_read_timesServicesI.getcountByUpIp(upIp);
					//如果不重复，直接加一
					if(result==null){
						//赋值up_down
						upIp.setUp_down(up_down);
						//获取原来的blog
						blog = blogService.getcontById(upIp.getbId());
						//在up_ip表中添加IP记录
						up_read_timesServicesI.addUpIp(upIp);
						//顶
						if(up_down==1){
							blog.setUp(blog.getUp()+1);
							//更新BLOG表
							boolean end = blogService.updateBlog(blog);
							//更新成功
							if (end==true) {
								return blog;
							}
							//更新失败
							else{
								return null;
							}
						}
						//踩
						else{
							blog.setDown(blog.getDown()+1);
							//更新BLOG表
							boolean end = blogService.updateBlog(blog);
							//更新成功
							if (end==true) {
								return blog;
							}
							//更新失败
							else{
								return null;
							}
						}
					}
					//如果已经记录IP重复
					else{
						//相反的重复，继续
						if(result.getUp_down()!=up_down){
							//把IP记录的动作更改
							result.setUp_down(result.getUp_down()==1?2:1);
							up_read_timesServicesI.updateUpIp(result);
						//获取原来的blog
						blog = blogService.getcontById(upIp.getbId());
						//顶
						if(up_down==1){
							blog.setUp(blog.getUp()+1);
							blog.setDown(blog.getDown()-1);
							//更新BLOG表
							boolean end = blogService.updateBlog(blog);
							//更新成功
							if (end==true) {
								return blog;
							}
							//更新失败
							else{
								return null;
							}
						}
						//踩
						else{
							blog.setUp(blog.getUp()-1);
							blog.setDown(blog.getDown()+1);
							//更新BLOG表
							boolean end = blogService.updateBlog(blog);
						
							//更新成功
							if (end==true) {
								return blog;
							}
							//更新失败
							else{
								return null;
							}
						}
						}
						//相同的重复，结束
						else{
							return null;
							
						}
						
						
					}
			
					
           }
			 //审核博客通过
			@RequestMapping(value="/pendblog" ,method=RequestMethod.POST)
			 @ResponseBody
				public boolean pendblog(HttpServletRequest request,HttpServletResponse response
						,@RequestBody Map<Object, Integer> map){
				//获取待审核ID
				int bId=0;
				bId = map.get("bId");
				//审核成功服务
				boolean result = false;
				result = blogService.pending(bId);
			
				return result;
					}
			
}
