package com.board.dao;



import com.board.vo.Comment;


public interface CommentDao {

	int insertComment(Comment comment);
	int updateComment(Comment comment);
	

	
}
