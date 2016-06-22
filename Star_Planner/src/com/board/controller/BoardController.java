package com.board.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.service.BoardService;
import com.board.vo.Board;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService service;
	
	//noticeList
	@RequestMapping("/boardList")
	public ModelAndView boardList(String singer, int page){
		System.out.println("ggg");
		if(page==0){
			page = 1;
		}
		int singer_id = 5;
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
	public ModelAndView boardView(int no){
		Board board = service.getBoard(no);
		
		return new ModelAndView("/board_detail.do", "board", board);
		
	}
	
	//boardWriterForm
	@RequestMapping("/boardWriterForm")
	public ModelAndView boardWriterForm(){
		return new ModelAndView("redirect:/board_register.do");
	}
		
	//boardWriter
	@RequestMapping("/boardWriter")
	public ModelAndView boardWriter(String id, String board_title, String board_content){
		Board board = new Board(0, board_title, new Date(System.currentTimeMillis()), "test user", 0, board_content, 0, 5, "JYP");
		service.writeBoard(board);
		return new ModelAndView("redirect:/board/boardView.do?id="+id+"&no="+board.getBoard_no());
	}
	
	//searchSinger
	@RequestMapping("/searchSinger")
	@ResponseBody
	public List<String> searchSinger(String keyword){
		System.out.println(keyword);
		List<String> list= service.searchSinger(keyword);
		System.out.println(list);
		return list;
	}
	

}
