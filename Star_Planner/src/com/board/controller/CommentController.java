package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.board.service.CommentServiceImpl;
import com.board.vo.Comment;

@Controller
@RequestMapping("/board")
public class CommentController {
	
	@Autowired
	private CommentServiceImpl service;
	
	@RequestMapping("/selectComment.do")
	@ResponseBody
	public List<Comment> selectComment(){
	
		
	 List<Comment> list = service.selectComment();
	 System.out.println("CommentController  \n" +  list);
	 return list;
	}
	
	

}
