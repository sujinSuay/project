package com.board.dao;

import java.util.HashMap;
import java.util.List;

import com.board.vo.Board;

public interface BoardDao {
	public Board selectByNo(int no) ;
	public List<Board> selectList(int singer_id, int page);
	public int selectCountContents(int singer_id);
	public int insertBoard(Board board);
	public int updateViewCount(int no);
	public int updateBoard(Board board);
	public int deleteByNo(int no);
	public List<String> searchSinger(String keyword);
	public int StringToIntSingerId(String singer_name);
	public String selectGroupNameById(String m_id);
	public int updateLikesCount(int no);
}
