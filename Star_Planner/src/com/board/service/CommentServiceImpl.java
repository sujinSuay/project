package com.board.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.board.dao.CommentDao;
import com.board.vo.Comment;

@org.springframework.stereotype.Service
public class CommentServiceImpl {

	@Autowired
	@Qualifier("commentDaoImpl")
	private CommentDao dao;
	
	public void Business() {
		
		Date date = new Date(2016, 05, 25);
		Comment comment = new Comment(1,0, "댓글2", "회원3", date );
		System.out.println(comment);
		dao.insertComment(comment);
		
		
	}
		
		
	
	
	
}
