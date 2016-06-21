package com.member.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
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
	public ModelAndView joinMember(@ModelAttribute Member member) throws IOException{
		System.out.println(member);
		memberService.insertMember(member);
		return new ModelAndView("/main.do");
	}
	@RequestMapping("/checkId")
	@ResponseBody
	public String checkId(String m_id) throws IOException{
		System.out.println(m_id);
		Member mem = memberService.getMemberById(m_id);
		System.out.println(mem);
		if(mem==null) return "true"; else return "false"; 
	}
	@RequestMapping("/login")
	@ResponseBody
	public ModelAndView login(String m_id, String password) throws IOException{
		Member mem = memberService.loginMember(m_id, password);
		if(mem==null) return new ModelAndView("/login.do","m_id",m_id);
		return new ModelAndView("/main.do","longinId",m_id);
	}
}
