package com.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.BoardDao;
import com.board.vo.Board;
import com.common.dao.TypeListDao;
import com.common.util.Constants;
import com.common.util.PagingBean;
import com.common.util.TextUtil;
import com.common.vo.TypeList;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao dao;
	
	@Autowired
	private TypeListDao tdao;

	public List<TypeList> getWriteFormPrefix(String typeList){
		return tdao.selectByCodeCateory(typeList);
		
	}
	/**
	 * 공지사항 등록 처리.
	 * @param notice
	 * @throws SQLException
	 */
	public void writeBoard(Board board){
		//제목과 내용을 HTML에 맞게 변환
		board.setBoard_title(TextUtil.textToHtml(board.getBoard_title()));
		board.setBoard_content(TextUtil.textToHtml(board.getBoard_content()));
		dao.insertBoard(board);
	}
	/**
	 * 글번호로 공지사항을 조회하는 메소드.
	 * 글 조회 + 조회수 1증가.
	 * @param no
	 * @return
	 * @throws SQLException 
	 */
	public Board getBoard(int no){
		Board board = dao.selectByNo(no);
		dao.updateViewCount(no);
		return board;
	}
	/**
	 * 공지사항 목록 조회 처리.
	 * @param page 조회할 페이지 번호.
	 * @return
	 * @throws SQLException
	 */
	public Map<String, Object> list(int page){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", dao.selectList(page));
		map.put("paging", new PagingBean(dao.selectCountContents(), page));
		return map;
	}
	/**
	 * 공지 사항 글번호로 삭제 처리.
	 * @param no
	 * @throws SQLException
	 */
	public void removeByNo(int no){
		dao.deleteByNo(no);
	}
	/**
	 * 글 수정폼 조회. 
	 * - title과 content를 textarea에 맞게 변환한다.
	 * 말머리 목록도 조회해서 리턴.
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public Map<String, Object> getModifyNotice(int no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		Board board = dao.selectByNo(no);
		board.setBoard_title(TextUtil.htmlToText(board.getBoard_title()));
		board.setBoard_content(TextUtil.htmlToText(board.getBoard_content()));
		map.put("board", board);
		List<TypeList> typeList = tdao.selectByCodeCateory(Constants.NOTICE_BOARD_PREFIX);
		map.put("typeList", typeList);
		return map;
	}
	
	public void modifyNotice(Board board){
		//제목과 내용을 HTML에 맞게 변환
		board.setBoard_title(TextUtil.textToHtml(board.getBoard_title()));
		board.setBoard_content(TextUtil.textToHtml(board.getBoard_content()));
		dao.updateBoard(board);
	}
}
