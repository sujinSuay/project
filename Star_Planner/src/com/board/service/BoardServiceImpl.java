package com.board.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.BoardDao;
import com.board.vo.Board;
import com.common.dao.CommonDao;
import com.common.util.PagingBean;
import com.common.util.TextUtil;
import com.common.vo.SearchData;
import com.common.vo.Singer;
import com.member.dao.memberDao;
@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao dao;
	
	@Autowired
	private CommonDao cdao;
	
	@Autowired
	private memberDao mdao;
	
	@Override
	public String selectGroupNameById(String m_id) {
		return cdao.selectGroupNameById(m_id);
	}

	public List<String> getFavorite(String m_id){
		String fav = mdao.selectFavorite(m_id);
		List<String> list = new ArrayList<String>(Arrays.asList(fav.split(",")));
		return list;
	}
	
	/*public List<TypeList> getWriteFormPrefix(String typeList){
		return tdao.selectByCodeCateory(typeList);
		
	}*/

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
		return cdao.searchSinger(keyword);
	}
	
	public int StringToIntSingerId(String singer_name){
		try {
			int singer_id = cdao.StringToIntSingerId(singer_name);
			return singer_id;
		} catch (NullPointerException e) {
			return -1;
		}
		
	}
	
	@Override
	public int updateLikesCount(int no) {
		// TODO Auto-generated method stub
		return dao.updateLikesCount(no);
	}

	@Override
	public Map<String, Object> singerList() {
		List<Singer> s_list = cdao.selectAllSinger();
		List<String> t_list = cdao.selectByCodeCateory("singer_type");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for (int i = 0; i < t_list.size(); i++) {
			List<Singer> result = new ArrayList<Singer>();
			for (int j = 0; j < s_list.size(); j++) {
				if(s_list.get(j).getType_name().equals(t_list.get(i))){
					result.add(s_list.get(j));
				}
			}
			switch (t_list.get(i)) {
				case "남자그룹":
					map.put("mGroup", result);
					break;
				case "여자그룹":
					map.put("fGroup", result);
					break;
				case "남자솔로":
					map.put("mSolo", result);
					break;
				case "여자솔로":
					map.put("fSolo", result);
					break;
			}
		}
		return map;
	}

	@Override
	public int updateCountSearch(SearchData searchData) {
		// TODO Auto-generated method stub
		int i = -1;
		if(cdao.selectSearchData(searchData)==0){
			i = cdao.insertSearchData(searchData);
		}else{
			i = cdao.updateSearchData(searchData);
		}
		return i;
	}

	@Override
	public List<SearchData> selectSearchDataDesc(Date search_date) {
		// TODO Auto-generated method stub
		return cdao.selectSearchDataDesc(new SearchData(0, 0, search_date));
	}

	@Override
	public List<Board> selectBoardByLikes() {
		// TODO Auto-generated method stub
		return dao.selectBoardByLikes();
	}

	@Override
	public List<Board> selectBoardByView() {
		// TODO Auto-generated method stub
		return dao.selectBoardByView();
	}

	@Override
	public List<Singer> selectSingerByFavorite() {
		// TODO Auto-generated method stub
		return cdao.selectSingerByFavorite();
	}

	
	
	
}
