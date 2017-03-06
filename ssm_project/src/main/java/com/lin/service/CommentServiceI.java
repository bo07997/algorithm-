package com.lin.service;

import java.util.List;
import java.util.Map;

import com.lin.model.Comment;
import com.lin.model.v2model.Comment_Blog_User;
import com.lin.model.v2model.Comment_message;

public interface CommentServiceI {

	List<Comment_message> getComment(int bId);

	int addcomment(Comment comment);
	//获取某一博主的所有博客下的评论
	List<Comment_Blog_User> getAllComment(int uId);
   //获取某一博主发表过的所有评论
	List<Comment_Blog_User> getMyComment(int uId);
   //删除评论通过Id
	boolean delCommentById(int commentId);

	//获取全部评论
	List<Map<Object, Object>> getAll_root_comment();



}
