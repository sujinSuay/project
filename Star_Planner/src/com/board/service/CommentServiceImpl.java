package com.board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.board.dao.CommentDao;
import com.board.vo.Comment;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	@Qualifier("commentDaoImpl")
	private CommentDao dao;
	
	
	@Override
	public List<Comment> selectComment(int board_no){
		
		List<Comment> list =  dao.selectComment(board_no);
		return list;	
	}
	
	@Override
	public int insertComment(Comment comment){
		
		int selectCommentId = dao.selectCommentId();
		comment.setComment_id(selectCommentId); //현재 입력될 comment_id 값을 가져와서 생성자 comment에 재정의
		
	
			comment.setComment_family_id(selectCommentId);
		
		return dao.insertComment(comment); 
	}
	
	
	//reply에대한 답글인 경우
	public int insertComment(Comment comment, int family_id){
		
		int family = dao.selectFamilyId(family_id);		
		int selectCommentId = dao.selectCommentId();
		comment.setComment_id(selectCommentId); //현재 입력될 comment_id 값을 가져와서 생성자 comment에 재정의
		
			comment.setComment_family_id(family);
		
		return dao.insertComment(comment); 
	}
	
	
	
	@Override
	public int deleteComment(int comment_id){
	
		Comment comment = dao.selectById(comment_id);
		if(comment.getComment_check()==0){
			return dao.deleteComment(comment_id);
		}else{ //댓글의 댓글인 경우
			return dao.deleteCommentAndReply(comment_id);
		}
		
		
		
	}
	@Override
	public int modifyComment(HashMap<String, Object> map){
		return dao.modifyComment(map);
	}
	
	public int deleteCommentByBoard(int board_no){
		return dao.deleteCommentByBoard(board_no);
	}
		

	
	
}
