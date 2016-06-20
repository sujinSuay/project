package com.board.service;

import java.util.Map;

import com.board.vo.Board;

public interface BoardService {
	public void writeBoard(Board board);
	public Board getBoard(int no);
	public Map<String, Object> list(int page);
	public void removeByNo(int no);
	public Map<String, Object> getModifyNotice(int no);
	public void modifyNotice(Board board);
}
