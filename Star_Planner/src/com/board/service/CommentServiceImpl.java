package com.board.service;

import java.util.Date;
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
		System.out.println("CommentServiceImpl " + list);
		return list;	
	}
	
	@Override
	public int insertComment(Comment comment){
		
		System.out.println("CommentServiceImpl InsertCommnet 실행");
		int selectCommentId = dao.selectCommentId();
		comment.setComment_id(selectCommentId); //현재 입력될 comment_id 값을 가져와서 생성자 comment에 재정의
		
	
			comment.setComment_family_id(selectCommentId);
		
		return dao.insertComment(comment); 
	}
	
	
	//reply에대한 답글인 경우
	public int insertComment(Comment comment, int family_id){
		
		System.out.println("CommentServiceImpl InsertCommnet 실행");
		int family = dao.selectFamilyId(family_id);		
		int selectCommentId = dao.selectCommentId();
		comment.setComment_id(selectCommentId); //현재 입력될 comment_id 값을 가져와서 생성자 comment에 재정의
		
			comment.setComment_family_id(family);
			System.out.println("%%  " + family);
		
		return dao.insertComment(comment); 
	}
	
	
	
	@Override
	public int deleteComment(int comment_id){
	
		System.out.println("CommentServiceImpl deleteComment 실행");
		Comment comment = dao.selectById(comment_id);
		if(comment.getComment_check()==0){
			return dao.deleteComment(comment_id);
		}else{ //댓글의 댓글인 경우
			return dao.deleteCommentAndReply(comment_id);
		}
		
		
		
	}
	@Override
	public int modifyComment(HashMap<String, Object> map){
		System.out.println("CommentServiceImpl modifyComment 실행");
		return dao.modifyComment(map);
	}
	
	public int deleteCommentByBoard(int board_no){
		System.out.println("CommentServiceImpl deleteCommentByBoard 실행 board: + "+ board_no);
		return dao.deleteCommentByBoard(board_no);
	}
		
		
	
	
	
}
