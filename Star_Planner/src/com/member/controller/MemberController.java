package com.member.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;

import com.member.service.MemberServiceImpl;
import com.member.vo.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberServiceImpl memberService;
	
	@RequestMapping("/join")
	public String joinMember(@ModelAttribute Member member) throws IOException{
		System.out.println(member);
		memberService.insertMember(member);
		return "/main.do";
	}
	@RequestMapping("/checkId")
	@ResponseBody
	public String checkId(String m_id) throws IOException{
		System.out.println(m_id);
		Member mem = memberService.getMemberById(m_id);
		System.out.println(mem);
		if(mem==null) return "true"; else return "false"; 
		
	}
}
