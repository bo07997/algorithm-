package com.lin.dao;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.lin.model.Blog;
import com.lin.model.v2model.Blog_table;
import com.lin.model.v2model.Blogv2;
@Repository 
public interface BlogMapper {
    List<Blog> selectList(String date);
	
    boolean deleteByPrimaryKey(int bId);

    int insert(Blog record);

    boolean insertSelective(Blog record);
    
    boolean insertSelective_root(Blog record);

    Blog selectByPrimaryKey(int bId);

    int updateByPrimaryKeySelective(Blog record);

    boolean updateByPrimaryKeyWithBLOBs(Blog record);

    int updateByPrimaryKey(Blog record);

    List<Blogv2> selectMapList(int uId);

	List<Blog> selectreadTimesList(int uId);

	List<Blog> selectcommonsTimesList(int uId);

	List<Blog> selectallList(int uId);

	List<Blog> selectcateList(Map<String, Integer> catemap);

	List<Blog> selectreblogList(int uId);

	List<Blog> selectdraftblogList(int uId);

	List<Blog> seleteblogsByDate(Map<String, String> catemap);

	boolean updateCateId(Blog_table blog_table);

	boolean updatecommonauth(Blog_table blog_table);

	Blog selectcontByMap(Map<String, Object> blogmap);

	boolean deleteByPrimaryKey_draftblog(int bId);

	boolean deleteByPrimaryKey_reblog(int bId);

	boolean insertSelective_draft_blog(Blog draft_blog);

	int selectAllCommentTimes(int uId);

	//查询所有博客
	List<Blog> select_all_users_List();

	//查询所有待审核博客
	List<Blog> select_all_users_rootList();

	boolean deleteroot_BlogBybId(int bId);

	//查询待审核博客 通过ID
	Blog select_root_blog(int bId);

	//删除待审核博客
	void deleteByPrimaryKey_rootblog(int bId);

	//按类别，时间查看主页博客
	List<Blog> selectHomeListAndcate(Map<String, String> map);


}