package com.board.dao;

import java.util.HashMap;
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
	public int selectCommentId() {
		
		int comment_id = session.selectOne(namespace+"selectCommentId");
		System.out.println("$$$$$$$$$$$$$$$$$$$   "+ comment_id);
		return comment_id;
	}
	
	
	@Override
	public int insertComment(Comment comment) {

		int count =  session.insert(namespace+"insertComment", comment);
		System.out.println("####################################  " + count);
		return count;
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

	@Override
	public int modifyComment(HashMap<String, Object> map) {
		System.out.println("CommentDaoImpl modifyComment실행");
		return session.update(namespace + "modifyComment", map );
	}

	

}
