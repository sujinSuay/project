package com.board.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

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
	
	@RequestMapping("/boardMain")
	public ModelAndView boardMain(HttpSession session){
		String id = (String)session.getAttribute("loginId");
		if(id!=null){
			List<String> list = service.getFavorite(id);
			return new ModelAndView("/board_main.do", "list" , list);
		}else{
			return new ModelAndView("/board_main.do");
		}
		
	}
	@Autowired
	private CommentServiceImpl service_comment;
	
	//noticeList
	@RequestMapping("/boardList")
	public ModelAndView boardList(String id, int page){
		if(page==0){
			page = 1;
		}
		int singer_id = service.StringToIntSingerId(id);
		Map<String, Object> list = service.list(singer_id, page);
		return new ModelAndView("/board_list.do", list);
	}
	
	//NoticeModify
	@RequestMapping("/boardModify")
	public ModelAndView boardModify(String id, int no, String board_title, String board_content){
		Board board = new Board(no, board_title, board_content);
		service.modifyBoard(board);
		return new ModelAndView("redirect:/board/boardView.do?id="+id+"&no="+no);
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
	public ModelAndView boardView(int no, int page, String id){
		id = URLEncoder.encode(id);
	
		System.out.println("!!!!!!!!!!! " + id);
		System.out.println("4444444");
		Board board = service.getBoard(no);
		System.out.println("페이지 : " + page);
		
		List<Comment> list_comment = service_comment.selectComment(no);
		
		
		//가수이름에 따른 가수 번호를 구하는 dao를 만들어서 적용하도록 추후 변경
		int singer_id = 5; 
		if(page==0){
			page = 1;
		}
		
		Map<String, Object> list_board = service.list(singer_id, page);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("board", board);
		map.put("list_comment", list_comment);

		map.put("list", list_board.get("list"));
		map.put("paging", list_board.get("paging"));
		
		System.out.println("##"+map.toString());
		
		return new ModelAndView("/board_detail.do", map);
	}
	
	//boardWriterForm
	@RequestMapping("/boardWriterForm")
	public ModelAndView boardWriterForm(){
		return new ModelAndView("/board_register.do");
	}
		
	//boardWriter
	@RequestMapping("/boardWriter")
	public ModelAndView boardWriter(String id, String board_title, String board_content, HttpSession session){
		Board board = new Board(0, board_title, new Date(System.currentTimeMillis()), (String)session.getAttribute("loginId"), 0, board_content, 0, 5, "JYP");
		service.writeBoard(board);
		System.out.println("@@@@@@@@@@@@@@@@@@" + id);
		id = URLEncoder.encode(id);
		return new ModelAndView("redirect:/board/boardView.do?id="+id+"&no="+board.getBoard_no()+"&page=1");
	}
	
	//searchSinger
	@RequestMapping("/searchSinger")
	@ResponseBody
	public List<String> searchSinger(String keyword){
		List<String> list= service.searchSinger(keyword);
		return list;
	}
	

}
