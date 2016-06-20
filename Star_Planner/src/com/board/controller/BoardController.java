package com.board.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.service.BoardService;
import com.board.vo.Board;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService service;
	
	//NoticeWriterForm
	@RequestMapping("/NoticeWriterForm")
	public String NoticeWriterForm(){
		System.out.println("noticeWriter");
		service.writeNotice(new Board(0, "test", new Date(System.currentTimeMillis()), "testId", 0, "test content", 0, 5, "공연"));

		return "/WEB-INF/board/board_detail.jsp";
		/*NoticeBoardService service = NoticeBoardService.getInstance();
		try {
			return new AttributeAndView("/WEB-INF/view/notice_board/write_form.jsp", false, "codeList", service.getWriteFormPrefix());
		} catch (Exception e) {
			e.printStackTrace();
			return new AttributeAndView("/WEB-INF/view/error.jsp", false, "errorMessage", e.getMessage());
		}*/
	}
	
	//noticeList
	/*@RequestMapping("/noticeList")
	@ResponseBody
	public ModelAndView noticeList(int page){
		if(page==0){
			System.out.println("page=0 자동세팅->1");
			page = 1;
		}
		Map<String, Object> attributes = service.list(page);
		return new ModelAndView("/WEB-INF/board/board_list.jsp", "result", attributes);
		//return new AttributeAndView("/WEB-INF/view/error.jsp", false, "errorMessage", "공지사항 목록 조회 도중 오류가 발생 : "+e.getMessage());
		
	}*/
	
	//NoticeModify
	/*@RequestMapping("/NoticeModify")
	@ResponseBody
	public String NoticeModify(){
		
		NoticeBoardService service = NoticeBoardService.getInstance();
		
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
			
			ArrayList<Code> prefixList = service.getWriteFormPrefix();
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
	}
	
	//NoticeModiftForm
	@RequestMapping("/NoticeModiftForm")
	@ResponseBody
	public String NoticeModiftForm(){
		try{
			int no = Integer.parseInt(request.getParameter("no"));
			
			NoticeBoardService service = NoticeBoardService.getInstance();
			Map<String, Object> map= service.getModifyNotice(no);
			return new AttributeAndView("/WEB-INF/view/notice_board/modify_form.jsp", false, map);
		}catch(Exception e){
			e.printStackTrace();
			return new AttributeAndView("/WEB-INF/view/error.jsp", false, "errorMessage", e.getMessage());
		}
	}
	
	//NoticeRemove
	@RequestMapping("/NoticeRemove")
	@ResponseBody
	public String NoticeRemove(){
		try{
			int no = Integer.parseInt(request.getParameter("no"));
			
			NoticeBoardService service = NoticeBoardService.getInstance();
			service.removeByNo(no);
			return new AttributeAndView(request.getContextPath()+"/controller?command=noticeList&page="+request.getParameter("page"), true);
		}catch(Exception e){
			e.printStackTrace();
			return new AttributeAndView("/WEB-INF/view/error.jsp", false, "errorMessage", e.getMessage());
		}
	}
	
	//NoticView
	@RequestMapping("/NoticView")
	@ResponseBody
	public String NoticView(){
		try{
			int no = Integer.parseInt(request.getParameter("no"));
			
			NoticeBoardService service = NoticeBoardService.getInstance();
			Notice notice = service.getNotice(no);
			return new AttributeAndView("/WEB-INF/view/notice_board/notice_view.jsp", false, "notice", notice);
		}catch(Exception e){
			e.printStackTrace();
			return new AttributeAndView("/WEB-INF/view/error.jsp", false, "errorMessage", e.getMessage());
		}
	}
	
	//NoticeWriter
	@RequestMapping("/NoticeWriter")
	@ResponseBody
	public String NoticeWriter(){
		String prefix = request.getParameter("prefix");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		ArrayList<String> errorList = new ArrayList<String>();
		if(title==null || title.trim().isEmpty()){
			errorList.add("공지사항 제목을 넣으세요.");
		}
		if(content == null||content.trim().isEmpty()){
			errorList.add("공지사항 내용을 넣으세요.");
		}
		if(errorList.size() != 0){
			return new AttributeAndView("/controller?command=noticeWriteForm", false, "errorList", errorList);
		}
		
		Notice notice = new Notice(prefix, title, content, new Date());
		NoticeBoardService service = NoticeBoardService.getInstance();
		try{
			service.writeNotice(notice);
			return new AttributeAndView(request.getContextPath()+"/controller?command=noticeView&no="+notice.getNo(), true);
		} catch (Exception e) {
			e.printStackTrace();
			return new AttributeAndView("/WEB-INF/view/error.jsp", false, "errorMessage", "등록 도중 오류가 발생 : "+e.getMessage());
		}
	}
	*/

}
