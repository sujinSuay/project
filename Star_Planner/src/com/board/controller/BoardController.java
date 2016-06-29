package com.board.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.service.BoardService;
import com.board.service.CommentServiceImpl;
import com.board.vo.Board;
import com.board.vo.Comment;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService service;
	  
	@Autowired
	private CommentServiceImpl service_comment;
	
	@RequestMapping("/boardMain")
	public ModelAndView boardMain(HttpSession session){
		
		Map<String, Object> singer = service.singerList();
		
		
		String id = (String)session.getAttribute("loginId");
		if(id!=null){
			List<String> favorite = service.getFavorite(id);
			if(favorite==null){
				return new ModelAndView("/board_main.do", singer);
			}else{
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("singer", singer);
				map.put("favorite", favorite);
				return new ModelAndView("/board_main.do", map);
			}
		}else{
			return new ModelAndView("/board_main.do", singer);
		}
	}
	
	//noticeList
	@RequestMapping("/boardList")
	public ModelAndView boardList(String id, int page){
		if(page==0){
			page = 1;
		}
		int singer_id = service.StringToIntSingerId(id);
		if(singer_id == -1){
			return new ModelAndView("redirect:/board/boardMain.do");
		}
		Map<String, Object> list = service.list(singer_id, page);
		return new ModelAndView("/board_list.do", list);
	}
	
	//NoticeModify
	@RequestMapping("/boardModify")
	public ModelAndView boardModify(String id, int no, int page, String board_title, String board_content) throws UnsupportedEncodingException{
		Board board = new Board(no, board_title, board_content);
		service.modifyBoard(board);
		return new ModelAndView("redirect:/board/boardView.do?id="+URLEncoder.encode(id,"UTF-8")+"&no="+no+"&page="+page);
	}

	//boardModifyForm
	@RequestMapping("/boardModifyForm")
	public ModelAndView boardModifyForm(int no){
		Map<String, Object> board = service.getModifyBoard(no);
		return new ModelAndView("/board_modify.do", board);
	}
	
	
	//boardRemove
	@RequestMapping("/boardRemove")
	public ModelAndView boardRemove(String id, int no, int page){
	
		service.removeByNo(no);
		return boardList(id, page);
	}
	
	//boardView
	@RequestMapping("/boardView")

	public ModelAndView boardView(int no, int page, String id) throws UnsupportedEncodingException{
		Board board = service.getBoard(no);
		
		List<Comment> list_comment = service_comment.selectComment(no);
		
		int singer_id = service.StringToIntSingerId(id);
		Map<String, Object> list_board = service.list(singer_id, page);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("board", board);
		map.put("list_comment", list_comment);
		map.put("list", list_board.get("list"));
		map.put("paging", list_board.get("paging"));
		
		return new ModelAndView("/board_detail.do", map);
	}
	
	//boardWriterForm
	@RequestMapping("/boardWriterForm")
	public ModelAndView boardWriterForm(){
		return new ModelAndView("/board_register.do");
	}
		
	//boardWriter
	@RequestMapping("/boardWriter")
	public ModelAndView boardWriter(String id, String board_title, String board_content, HttpSession session, HttpServletRequest req) throws UnsupportedEncodingException{
		int singer_id = service.StringToIntSingerId(id);
		String m_id = (String)session.getAttribute("loginId");
		if(m_id==null){
			System.out.println("자동 로그아웃됨");
			return new ModelAndView("redirect:/board/boardList.do?id="+URLEncoder.encode(id,"UTF-8")+"&page=1");
		}
		String group_name = service.selectGroupNameById(m_id);
		Board board = new Board(0, board_title, new Date(System.currentTimeMillis()), m_id, 0, board_content, 0, singer_id, group_name);
		service.writeBoard(board);

		return new ModelAndView("redirect:/board/boardView.do?id="+URLEncoder.encode(id,"UTF-8")+"&no="+board.getBoard_no()+"&page=1");

	}
	
	//searchSinger
	@RequestMapping("/searchSinger")
	@ResponseBody
	public List<String> searchSinger(String keyword){
		List<String> list= service.searchSinger(keyword);
		return list;
	}
	
	//boardLike
	@RequestMapping("/boardLike")
	@ResponseBody
	public int boardLike(int no, int likes){
		service.updateLikesCount(no);
		return likes+1;
	}
	

}
