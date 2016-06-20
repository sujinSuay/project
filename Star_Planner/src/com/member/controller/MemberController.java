package com.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.member.service.MemberService;
import com.member.vo.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/join")
	public String joinMember(Member member){
		System.out.println("11");
		return "/Star_Planner/main.do";
	}
}
