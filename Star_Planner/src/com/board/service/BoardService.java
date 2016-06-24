package com.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.board.vo.Board;

public interface BoardService {
	public void writeBoard(Board board);
	public Board getBoard(int no);
	public Map<String, Object> list(int singer_id, int page);
	public void removeByNo(int no);
	public Map<String, Object> getModifyBoard(int no);
	public void modifyBoard(Board board);
	public List<String> searchSinger(String keyword);
	public int StringToIntSingerId(String singer_id);
	public List<String> getFavorite(String m_id);
	public String selectGroupNameById(String m_id);
	public List<Board> selectBoardListByMemberId(HashMap<String, String> map);
}
