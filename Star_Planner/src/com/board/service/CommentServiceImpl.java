package com.board.service;

import java.util.Date;
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
	
	
	
	public List<Comment> selectComment(){
		
		List<Comment> list =  dao.selectComment();
		System.out.println("CommentServiceImpl " + list);
		return list;	
	}
	
	
	/*public void Business() {
		
		Date date = new Date(2016, 05, 25);
		Comment comment = new Comment(1,0, "댓글2", "회원3", date );
		System.out.println(comment);
		dao.insertComment(comment);
		
		
	}*/
		
		
	
	
	
}
