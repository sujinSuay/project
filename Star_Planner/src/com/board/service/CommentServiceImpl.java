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
public class CommentServiceImpl {

	@Autowired
	@Qualifier("commentDaoImpl")
	private CommentDao dao;
	
	
	
	public List<Comment> selectComment(int board_no){
		
		List<Comment> list =  dao.selectComment(board_no);
		System.out.println("CommentServiceImpl " + list);
		return list;	
	}
	

	public void insertComment(Comment comment){
		
		System.out.println("CommentServiceImpl InsertCommnet 실행");
		dao.insertComment(comment);
	
	}
	
	public void deleteComment(int comment_id){
	
		System.out.println("CommentServiceImpl deleteComment 실행");
		dao.deleteComment(comment_id);
	}
	
	public void modifyComment(HashMap<String, Object> map){
		System.out.println("CommentServiceImpl modifyComment 실행");
		dao.modifyComment(map);
	}
	
	
	/*public void Business() {
		
		Date date = new Date(2016, 05, 25);
		Comment comment = new Comment(1,0, "댓글2", "회원3", date );
		System.out.println(comment);
		dao.insertComment(comment);
		
		
	}*/
		
		
	
	
	
}
