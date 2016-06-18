package com.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.vo.Comment;

@Repository
public class CommentDaoImpl implements CommentDao {

	private String namespace="board.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override
	public int insertComment(Comment comment) {
		System.out.println("dd");
		return session.insert(namespace+"insertComment", comment);
	}

	@Override
	public int updateComment(Comment comment) {
		// TODO Auto-generated method stub
		return 0;
	}

}
