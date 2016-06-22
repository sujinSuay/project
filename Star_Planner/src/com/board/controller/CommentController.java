package com.board.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.service.CommentServiceImpl;
import com.board.vo.Comment;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	private CommentServiceImpl service;
	
	@RequestMapping("/selectComment.do")
	@ResponseBody
	public List<Comment> selectComment(@RequestParam(value="board_no") int board_no){
	
		
	 List<Comment> list = service.selectComment(board_no);
	 System.out.println("CommentController  \n" +  list);
	 return list;
	}
	
	
	@RequestMapping("/insertComment.do")
	@ResponseBody
	public Comment insertComment(@RequestParam(value="comment_content") String content, String m_id, int board_no){
		//등록할 게시글의 고유 번호, 댓글의 고유 아이디, 댓글 내용, 댓글 게시한 회원 아이디, 댓글 게시한 날짜
		System.out.println("입력받은 댓글 내용   " + content);
		Comment comment = new Comment(board_no,0,content, m_id, new Date(System.currentTimeMillis()));
		service.insertComment(comment);
		return comment;
		
	}
	
	@RequestMapping("/deleteComment.do")
	@ResponseBody
	public List<Comment> deleteComment(int comment_id ){
		
		System.out.println("deleteComment");
		service.deleteComment(comment_id);
		
		return null;
	}
	
	@RequestMapping("/modifyComment.do")
	@ResponseBody
	public HashMap<String, Object> modifyComment(int comment_id,String comment_content){
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("comment_id",comment_id );
		map.put("comment_content", comment_content);
		
		
		System.out.println("modifyComment 전송받은 값 :" + map.toString());
		service.modifyComment(map);
		
		return map;
	}
	
	
	

}
