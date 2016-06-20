package com.board.service;

import java.util.Map;

import com.board.vo.Board;

public interface BoardService {
	public void writeBoard(Board board);
	public Board getBoard(int no);
	public Map<String, Object> list(int singer_id, int page);
	public void removeByNo(int no);
	public Map<String, Object> getModifyBoard(int no);
	public void modifyBoard(Board board);
}
