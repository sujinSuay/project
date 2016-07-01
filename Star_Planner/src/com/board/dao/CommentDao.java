package com.board.dao;



import java.util.HashMap;
import java.util.List;

import com.board.vo.Comment;


public interface CommentDao {

	int selectCommentId();
	int insertComment(Comment comment);
	int updateComment(Comment comment);
	int deleteComment(int comment_id);
	int deleteCommentAndReply(int comment_id);
	Comment selectById(int comment_id);
	int modifyComment(HashMap<String, Object> map);
	
	List<Comment> selectComment(int board_no);
	
	int selectFamilyId(int family_id);
	
	public int deleteCommentByBoard(int board_no);
	
}
