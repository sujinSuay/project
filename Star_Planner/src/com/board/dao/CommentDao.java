package com.board.dao;



import java.util.List;

import com.board.vo.Comment;


public interface CommentDao {

	int insertComment(Comment comment);
	int updateComment(Comment comment);
	
	List<Comment> selectComment();
	

	
}
