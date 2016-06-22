package com.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		return new ModelAndView("redirect:/main.do");
	}
	@RequestMapping("/checkId")
	@ResponseBody
	public String checkId(String m_id) throws IOException{
		System.out.println(m_id);
		Member mem = memberService.getMemberById(m_id);
		System.out.println(mem);
		if(mem==null) return "false"; else return "true"; 
	}
	@RequestMapping("/login")
	@ResponseBody
	public ModelAndView login(String m_id, String password, HttpSession session) throws IOException{
		Member mem = memberService.loginMember(m_id, password);
		System.out.println(mem);
		if(mem==null){
			return new ModelAndView("redirect:/member_login.do","m_id",m_id);
		}
		session.setAttribute("loginId", mem.getM_id());
		session.setAttribute("group_Id", mem.getGroup_id());
		return new ModelAndView("/main.do");
	}
	@RequestMapping("/logout")
	public ModelAndView login(HttpSession session){
		session.invalidate();
		return new ModelAndView("/main.do");
	}
	
	@RequestMapping("/mypage")
	public ModelAndView mypage(HttpSession session) throws IOException{
		if(session.getAttribute("loginId")==null){
			return new ModelAndView("/main.do","errors","로그인을 해주세요.");
		} 
		Member mem = memberService.getMemberById((String)session.getAttribute("loginId"));
		System.out.println(mem);
		return new ModelAndView("member/member_mypage.tiles","member",mem);
		
	}
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(HttpSession session) throws IOException{
		if(session.getAttribute("loginId")==null){
			return new ModelAndView("/main.do","errors","로그인을 해주세요.");
		} 
		Member mem = memberService.getMemberById((String)session.getAttribute("loginId"));
		System.out.println(mem);
		return new ModelAndView("member/member_modify.tiles","member",mem);
		
	}
	@RequestMapping("/modify")
	public ModelAndView modify(String m_id, String password, String email, String phone) throws IOException{
		System.out.println(m_id);
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("password", password);
		map.put("email", email);
		map.put("phone", phone);
		map.put("m_id", m_id);
		memberService.updateMemberById(map);
		return new ModelAndView("member/member_mypage.tiles");
		
	}
}
