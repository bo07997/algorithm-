package com.lin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lin.dao.CommentMapper;
import com.lin.model.Comment;
import com.lin.model.v2model.Comment_Blog_User;
import com.lin.model.v2model.Comment_message;
import com.lin.service.CommentServiceI;
@Service("CommentService")
public class CommentServiceimpl implements CommentServiceI {

	@Resource
	private CommentMapper commentMapper;

	@Autowired
	public void setCommentMapper(CommentMapper commentMapper) {
		this.commentMapper = commentMapper;
	}

	@Override
	public List<Comment_message> getComment(int bId) {
		return commentMapper.selectBybId(bId);
	}

	@Override
	public int addcomment(Comment comment) {
		return commentMapper.insertSelective(comment);
	}

	@Override
	public List<Comment_Blog_User> getAllComment(int uId) {
		return commentMapper.selectAllComment(uId);
	}

	@Override
	public List<Comment_Blog_User> getMyComment(int uId) {
		return commentMapper.selectMyComment(uId);
	}

	@Override
	public boolean delCommentById(int commentId) {
		return commentMapper.deleteByPrimaryKey(commentId);
	}

	@Override
	public List<Map<Object, Object>> getAll_root_comment() {
		return commentMapper.selectAll_root_comment();
	}
	
	
	
}
