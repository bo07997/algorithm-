package com.lin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.lin.model.Comment;
import com.lin.model.v2model.Comment_Blog_User;
import com.lin.model.v2model.Comment_message;
@Repository 
public interface CommentMapper {
    boolean deleteByPrimaryKey(Integer commentId);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer commentId);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);

	List<Comment_message> selectBybId(int bId);

	List<Comment_Blog_User> selectAllComment(int uId);

	List<Comment_Blog_User> selectMyComment(int uId);

	//获取全部评论
	List<Map<Object, Object>> selectAll_root_comment();
}