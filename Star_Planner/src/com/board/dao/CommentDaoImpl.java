package com.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.vo.Comment;

@Repository
public class CommentDaoImpl implements CommentDao {

	private String namespace="comment.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override
	public int insertComment(Comment comment) {

		return session.insert(namespace+"insertComment", comment);
	}

	@Override
	public int updateComment(Comment comment) {
		
		return 0;
	}

	
	public List<Comment> selectComment(int board_no) {
		System.out.println("selectComment() : 댓글 전체 조회");
		return session.selectList(namespace + "selectComment", board_no);
	}

	@Override
	public int deleteComment(int id) {
		
		System.out.println("CommentDaoImpl deleteComment실행");
		return session.delete(namespace+"deleteComment", id);
	}

}
