package com.board.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.BoardDao;
import com.board.vo.Board;
import com.common.dao.TypeListDao;
import com.common.util.PagingBean;
import com.common.util.TextUtil;
import com.common.vo.TypeList;
import com.member.dao.MemberDao;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao dao;
	
	@Autowired
	private TypeListDao tdao;
	
	@Autowired
	private MemberDao mdao;
	
	@Override
	public String selectGroupNameById(String m_id) {
		return dao.selectGroupNameById(m_id);
	}

	public List<String> getFavorite(String m_id){
		String fav = mdao.selectFavorite(m_id);
		List<String> list = new ArrayList<String>(Arrays.asList(fav.split(",")));
		return list;
	}
	
	public List<TypeList> getWriteFormPrefix(String typeList){
		return tdao.selectByCodeCateory(typeList);
		
	}

	public void writeBoard(Board board){
		//제목과 내용을 HTML에 맞게 변환
		board.setBoard_title(TextUtil.textToHtml(board.getBoard_title()));
		board.setBoard_content(TextUtil.textToHtml(board.getBoard_content()));
		dao.insertBoard(board);
	}

	public Board getBoard(int board_no){
		Board board = dao.selectByNo(board_no);
		dao.updateViewCount(board_no);
		return board;
	}

	public Map<String, Object> list(int singer_id, int page){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", dao.selectList(singer_id, page));
		map.put("paging", new PagingBean(dao.selectCountContents(singer_id), page));
		return map;
	}

	public void removeByNo(int board_no){
		dao.deleteByNo(board_no);
	}

	public Map<String, Object> getModifyBoard(int board_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		Board board = dao.selectByNo(board_no);
		board.setBoard_title(TextUtil.htmlToText(board.getBoard_title()));
		board.setBoard_content(TextUtil.htmlToText(board.getBoard_content()));
		map.put("board", board);
		/*List<TypeList> typeList = tdao.selectByCodeCateory(Constants.NOTICE_BOARD_PREFIX);
		map.put("typeList", typeList);*/
		return map;
	}
	
	public void modifyBoard(Board board){
		//제목과 내용을 HTML에 맞게 변환
		board.setBoard_title(TextUtil.textToHtml(board.getBoard_title()));
		board.setBoard_content(TextUtil.textToHtml(board.getBoard_content()));
		dao.updateBoard(board);
	}
	
	public List<String> searchSinger(String keyword){
		return dao.searchSinger(keyword);
	}
	
	public int StringToIntSingerId(String singer_name){
		return dao.StringToIntSingerId(singer_name);
	}
}
