package com.board.controller;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		if(page==0){
			System.out.println("page=0 자동세팅->1");
			page = 1;
		}
		int singer_id = 5;
		Map<String, Object> list = service.list(singer_id, page);
//		return new ModelAndView("/WEB-INF/board/board_list.jsp", list);
		return new ModelAndView("/board_list.do", list);
		//return new AttributeAndView("/WEB-INF/view/error.jsp", false, "errorMessage", "공지사항 목록 조회 도중 오류가 발생 : "+e.getMessage());
		
	}
	
	//NoticeModify
	/*@RequestMapping("/NoticeModify")
	@ResponseBody
	public String NoticeModify(){
		
		int no = 0; 
		String prefix = request.getParameter("prefix");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		ArrayList<String> errorList = new ArrayList<String>();
		
		try{
			no = Integer.parseInt(request.getParameter("no"));
		}catch(NumberFormatException ne){
			errorList.add("글번호가 문제가 있어 수정할 수 없습니다.");
		}
		if(prefix!=null && prefix.equals("말머리")){
			errorList.add("말머리를 입력하세요");
		}
		if(title==null || title.trim().isEmpty()){
			errorList.add("공지사항 제목을 넣으세요.");
		}
		if(content == null||content.trim().isEmpty()){
			errorList.add("공지사항 내용을 넣으세요.");
		}
		if(errorList.size() != 0){
			return new AttributeAndView("/controller?command=noticeModifyForm", false, "errorList", errorList);
			
//			사용자가 입력한 글 유지 하기 위한 처리.
			
			ArrayList<TypeList> prefixList = service.getWriteFormPrefix();
			HashMap<String, Object> map = new HashMap();
			map.put("codeList", prefixList);
			map.put("errorList", errorList);
			return new AttributeAndView("/WEB-INF/view/notice_board/modify_form2.jsp", false,  map);
			
		}
		
		Notice notice = new Notice(no, prefix, title, content);
		
		try{
			service.modifyNotice(notice);
			return new AttributeAndView(request.getContextPath()+"/controller?command=noticeView&no="+no+"&page="+request.getParameter("page"), true);
		} catch (Exception e) {
			e.printStackTrace();
			return new AttributeAndView("/WEB-INF/view/error.jsp", false, "errorMessage", "등록 도중 오류가 발생 : "+e.getMessage());
		}
	}*/
	
	/*//boardModifyForm
	@RequestMapping("/boardModifyForm")
	public String boardModifyForm(int no){
		Map<String, Object> map= service.getModifyBoard(no);
		return null;
	}*/
	
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
		//service.writeBoard(new Board(0, "test", new Date(System.currentTimeMillis()), "testId", 0, "test content", 0, 5, "공연"));
		//카테고리 불러와서 넘겨주는 곳
		return new ModelAndView("/board_register.do");
	}
		
	//boardWriter
	@RequestMapping("/boardWriter")
	public ModelAndView boardWriter(String board_title, String board_content){
		/*ArrayList<String> errorList = new ArrayList<String>();
		if(title==null || title.trim().isEmpty()){
			errorList.add("공지사항 제목을 넣으세요.");
		}
		if(content == null||content.trim().isEmpty()){
			errorList.add("공지사항 내용을 넣으세요.");
		}
		if(errorList.size() != 0){
			return new AttributeAndView("/controller?command=noticeWriteForm", false, "errorList", errorList);
		}*/
		
		Board board = new Board(0, board_title, new Date(System.currentTimeMillis()), "test user", 0, board_content, 0, 5, "JYP");
		service.writeBoard(board);
		System.out.println("등록 no : " + board.getBoard_no());
		return boardView(board.getBoard_no());
	}
	

}
