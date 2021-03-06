package com.board.controller;

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
	 
	 
	 
	 
	 return list;
	}
	
	
	//comment등록
	@RequestMapping("/insertComment.do")
	@ResponseBody
	public List<Comment> insertComment(@RequestParam(value="comment_content") String content, String m_id, int board_no){
		//등록할 게시글의 고유 번호, 댓글의 고유 아이디, 댓글 내용, 댓글 게시한 회원 아이디, 댓글 게시한 날짜
		Comment comment = new Comment(board_no,0,content, m_id, new Date(System.currentTimeMillis()),0, 0);
		service.insertComment(comment);
		
		return service.selectComment(board_no);
		
	}
	
	//reply 등록
	@RequestMapping("/insertReply.do")
	@ResponseBody
	public List<Comment> insertReply(int family_id, int comment_id, String comment_content, String m_id, int board_no){
	
		
		Comment comment = new Comment(board_no, 0, comment_content, m_id, new Date(System.currentTimeMillis()),comment_id,1);
		service.insertComment(comment, family_id);
		
		return service.selectComment(board_no);
	}
	
	@RequestMapping("/deleteComment.do")
	@ResponseBody
	public List<Comment> deleteComment(int comment_id, int board_no ){
		
		service.deleteComment(comment_id);
		
		return service.selectComment(board_no);
	}
	
	@RequestMapping("/modifyComment.do")
	@ResponseBody
	public int modifyComment(int comment_id,String comment_content){
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("comment_id",comment_id );
		map.put("comment_content", comment_content);
		
		
		
		return service.modifyComment(map);
	}
	
	
	

}
