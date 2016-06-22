package com.board.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	private String namespace_board="board.";
	private String namespace_singer="singer.";
	
	@Autowired
	private SqlSessionTemplate session;
	
	/**
	 * 글번호로 하나의 공지사항 글을 조회하는 메소드.
	 * @param conn
	 * @param no
	 * @return 조회한 공지사항. 글이 없을 경우 null
	 * @throws SQLException
	 */
	@Override
	public Board selectByNo(int no) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace_board+"selectByNo", no);
	}

	@Override
	public List<Board> selectList(int singer_id, int page) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("singer_id", singer_id);
		map.put("page", page);
		return session.selectList(namespace_board+"selectList", map);
	}

	/**
	 * 총 게시물 수를 조회하는 메소드.
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int selectCountContents() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace_board+"selectCountContents");
	}

	/**
	 * 공지사항 글을 insert하는 메소드.
	 * 글제목은 notice_board_seq 시퀀스를 이용해 넣는다. 조회수는 0으로 설정. 
	 * @param notice
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int insertBoard(Board board) {
		// TODO Auto-generated method stub
		return session.insert(namespace_board+"insert", board);
	}

	/**
	 * no로 view_count(조회수) update 처리.
	 * @param conn
	 * @param no
	 * @return
	 * @throws SQLException 
	 */
	@Override
	public int updateViewCount(int no) {
		// TODO Auto-generated method stub
		return session.update(namespace_board+"updateViewCount", no);
	}

	/**
	 * 공지사항 글번호로 하나 update
	 * @param conn
	 * @param notice
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int updateBoard(Board board) {
		// TODO Auto-generated method stub
		return session.update(namespace_board+"update", board);
	}

	@Override
	public int deleteByNo(int no) {
		// TODO Auto-generated method stub
		return session.delete(namespace_board+"deleteByNo", no);
	}

	@Override
	public List<String> searchSinger(String keyword) {
		// TODO Auto-generated method stub
		return session.selectList(namespace_singer+"searchSinger", keyword);
	}

	@Override
	public int StringToIntSingerId(String singer_name) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace_singer+"StringToIntSingerId", singer_name);
	}
	
	
	

}
