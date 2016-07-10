package com.board.service;

import java.util.HashMap;
import java.util.List;

import com.board.vo.Comment;

public interface CommentService {

	int modifyComment(HashMap<String, Object> map);

	int deleteComment(int comment_id);

	int insertComment(Comment comment);
	int insertComment(Comment comment, int family_id);


	List<Comment> selectComment(int board_no);

	int deleteCommentByBoard(int board_no);
	
		
		
}
