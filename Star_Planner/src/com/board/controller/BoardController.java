package com.board.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.board.service.BoardService;
import com.board.service.CommentServiceImpl;
import com.board.vo.Board;
import com.board.vo.Comment;
import com.common.vo.SearchData;
import com.common.vo.Singer;

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
		List<SearchData> list1 = service.selectSearchDataDesc(new java.sql.Date(System.currentTimeMillis()));
		List<Board> list2 = service.selectBoardByView();
		List<Board> list3 = service.selectBoardByLikes();
		List<Singer> list4 = service.selectSingerByFavorite();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("singer", singer);
		map.put("list1", list1);
		map.put("list2", list2);
		map.put("list3", list3);
		map.put("list4", list4);
		
		String id = (String)session.getAttribute("loginId");
		if(id!=null){
			List<String> favorite = service.getFavorite(id);
			if(favorite==null){
				return new ModelAndView("/board_main.do", map);
			}else{
				map.put("favorite", favorite);
				return new ModelAndView("/board_main.do", map);
			}
		}else{
			return new ModelAndView("/board_main.do", map);
		}
	}
	
	//noticeList
	@RequestMapping("/boardList")
	public ModelAndView boardList(String id, int page) throws ParseException{
		if(page==0){
			page = 1;
		}
		int singer_id = service.StringToIntSingerId(id);
		if(singer_id == -1){
			return new ModelAndView("redirect:/board/boardMain.do");
		}
		Map<String, Object> list = service.list(singer_id, page);
		service.updateCountSearch(new SearchData(singer_id, 0, new java.sql.Date(System.currentTimeMillis())));
		return new ModelAndView("/board_list.do", list);
	}
	
	//NoticeModify
	@RequestMapping("/boardModify")
	public ModelAndView boardModify(@RequestParam(required=false) MultipartFile upfile1,@RequestParam(required=false) MultipartFile upfile2,@RequestParam(required=false) MultipartFile upfile3, String id, int no, int page, String board_title, String board_content, HttpServletRequest req, String upfile1_lo,String upfile2_lo,String upfile3_lo) throws IllegalStateException, IOException{
		String board_link = "";
		String saveDir = req.getServletContext().getRealPath("/uploadFile"); //파일저장 디렉토리
		
		board_link = saveFile(upfile1,saveDir, upfile1_lo);
		board_link +=","+saveFile(upfile2,saveDir,upfile2_lo);
		board_link +=","+saveFile(upfile3,saveDir,upfile3_lo);
		
		Board board = new Board(no, board_title, board_content, board_link);
		service.modifyBoard(board);
		return new ModelAndView("redirect:/board/boardView.do?id="+URLEncoder.encode(id,"UTF-8")+"&no="+no+"&page="+page);
	}
	//file check
	public String saveFile(MultipartFile upfile, String saveDir, String link) throws IllegalStateException, IOException{
		String board_link;
		if(upfile!=null && !upfile.isEmpty()){
			String fileName="B"+String.valueOf(System.currentTimeMillis());
			board_link = fileName;
			File dest = new File(saveDir,fileName);
			upfile.transferTo(dest);
		} else if(link!=null) board_link=link; 
		  else board_link = "noData";
		return board_link;
	}
	//boardModifyForm
	@RequestMapping("/boardModifyForm")
	public ModelAndView boardModifyForm(int no){
		Map<String, Object> board = service.getModifyBoard(no);
		return new ModelAndView("/board_modify.do", board);
	}
	
	
	//boardRemove
	@RequestMapping("/boardRemove")
	public ModelAndView boardRemove(String id, int no, int page) throws ParseException{
		
		service_comment.deleteCommentByBoard(no);
		service.removeByNo(no);
		
		//해당하는 게시글의 댓글 삭제
		
		
		return boardList(id, page);
	}
	
	//boardView
	@RequestMapping("/boardView")
	public ModelAndView boardView(int no, int page, String id) throws UnsupportedEncodingException{
		Board board = service.getBoard(no);
		
		List<Comment> list_comment = service_comment.selectComment(no);
		int comment_count = list_comment.size();
		
		int singer_id = service.StringToIntSingerId(id);
		Map<String, Object> list_board = service.list(singer_id, page);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String[] file_names = board.getBoard_link().split(",");
		map.put("board", board);
		map.put("file_names", file_names);
		map.put("list_comment", list_comment);
		map.put("comment_count", comment_count);
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
	public ModelAndView boardWriter(@RequestParam List<MultipartFile> upfile,String id, String board_title, String board_content, HttpSession session, HttpServletRequest req) throws IllegalStateException, IOException{
		int singer_id = service.StringToIntSingerId(id);
		String m_id = (String)session.getAttribute("loginId");
		if(m_id==null){
			return new ModelAndView("redirect:/board/boardList.do?id="+URLEncoder.encode(id,"UTF-8")+"&page=1");
		}
		// 파일 업로드 처리
	
		String saveDir = req.getServletContext().getRealPath("/uploadFile"); //파일저장 디렉토리
		String board_link = "";
		if(upfile != null){ //null인 경우 upfile 이름으로 넘어온 요청파라미터가 없는 경우
			for(MultipartFile f: upfile){
				if(!f.isEmpty()){
					String fileName="B"+String.valueOf(System.currentTimeMillis())+f.getOriginalFilename();
					board_link +=(fileName) + ",";
					File dest = new File(saveDir,fileName);
					f.transferTo(dest);
				}else{
					board_link +="noData,";
				}
			}
		}
		if(board_link.equals("")) board_link="noData,noData,noData,";
		String group_name = service.selectGroupNameById(m_id);
		Board board = new Board(0, board_title, new Date(System.currentTimeMillis()), m_id, 0, board_content, 0, singer_id, group_name, board_link);
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
