package com.board.service;

import java.util.HashMap;
import java.util.List;

import com.board.vo.Comment;

public interface CommentService {

	void modifyComment(HashMap<String, Object> map);

	void deleteComment(int comment_id);

	void insertComment(Comment comment);

	List<Comment> selectComment(int board_no);
	
		
		
}
