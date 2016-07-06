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
		return comment_id;
	}
	
	
	@Override
	public int insertComment(Comment comment) {

		int count =  session.insert(namespace+"insertComment", comment);
		return count;
	}

	@Override
	public int updateComment(Comment comment) {
		
		return 0;
	}

	
	public List<Comment> selectComment(int board_no) {
		return session.selectList(namespace + "selectComment", board_no);
	}

	@Override
	public int deleteComment(int comment_id) {
		
		return session.delete(namespace+"deleteCommentAll", comment_id);
	}

	@Override
	public int modifyComment(HashMap<String, Object> map) {
		return session.update(namespace + "modifyComment", map );
	}


	@Override
	public int deleteCommentAndReply(int comment_id) {
		return session.delete(namespace+"deleteComment", comment_id);
	}


	@Override
	public Comment selectById(int comment_id) {
		
		return session.selectOne(namespace + "selectById", comment_id);
	}
	
	public int selectFamilyId(int family_id){
		return session.selectOne(namespace + "selectFamilyId", family_id);
	}
	
	//게시글 삭제시 댓글 삭제
	public int deleteCommentByBoard(int board_no){
		return session.delete(namespace + "deleteCommentByBoard", board_no);
	}
	

}
