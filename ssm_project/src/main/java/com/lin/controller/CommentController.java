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

import com.lin.model.Comment;
import com.lin.model.v2model.Comment_message;
import com.lin.service.CommentServiceI;

@Controller
@RequestMapping("/Comment")
public class CommentController {

	@Resource
	private CommentServiceI commentService; 

	@Autowired
	public void setCommentService(CommentServiceI commentService) {
		this.commentService = commentService;
	}
	
	//评论的获取
	@RequestMapping(value="/getComment/{bId}" ,method=RequestMethod.POST)
	@ResponseBody
	public List<Comment_message>  getComment(HttpServletRequest request,
			@PathVariable("bId") int bId,HttpServletResponse response){
		List<Comment_message> comment_message=null;
		comment_message = commentService.getComment(bId);
		return comment_message;
	}
	
	//评论的插入
		@RequestMapping(value="/addComment/{bId}" ,method=RequestMethod.POST)
		@ResponseBody
		public Comment   addComment(HttpServletRequest request,
				@PathVariable("bId") int bId,@RequestBody Comment comment,HttpServletResponse response){
			int result=commentService.addcomment(comment);
			if(result==1){
			return comment;
			}
			return null;
			
		}
		//通过评论ID删除评论
		@RequestMapping(value="/delComment/{commentId}" ,method=RequestMethod.POST)
		@ResponseBody
		public int delComment(HttpServletRequest request,
				@PathVariable("commentId") int commentId,HttpServletResponse response){
			@SuppressWarnings("unused")
			boolean result=commentService.delCommentById(commentId);
			if(result=true){
			return commentId;
			}
			return 0;
		}
		//获取全部评论并且转到相应页面
		@RequestMapping(value="/root/all_root_comment" ,method=RequestMethod.GET)
		public ModelAndView  getAll_root_comment(HttpServletRequest request,
				HttpServletResponse response){
			ModelAndView modelAndView = new ModelAndView("root/comment/all_root_comment");
			List<Map<Object, Object>> comments = null;
			comments = commentService.getAll_root_comment();
			modelAndView.addObject("root_comments", comments);
			return modelAndView;
		}
}
