package com.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.service.BoardService;
import com.board.service.CommentService;
import com.board.vo.Board;
import com.common.vo.Email;
import com.member.service.AdminServiceImpl;
import com.member.service.MemberService;
import com.member.vo.Member;
import com.member.vo.MyPage;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	CommentService commentService;
	@Autowired
	BoardService boardService;
	
	@Autowired
	AdminServiceImpl adminService;
	
	@Autowired
	private EmailSender emailSender;
	
	
	@RequestMapping("beforeJoin")
	public ModelAndView beforeJoin(){
		List<String> list = memberService.selectGroupList();
		System.out.println(list);
		return new ModelAndView("member/member_join.tiles","groupList",list);
	}
	@RequestMapping("/join")
	public ModelAndView joinMember(@ModelAttribute Member member, String tem_group2) throws Exception{
		if(member.getTem_group().equals("기타")){
			member.setTem_group(tem_group2);
		}
		System.out.println(member);
		memberService.insertMember(member);
		
		System.out.println("$$$$" + member);
		
		//이메일 보내주기 위한 로직 호출
		 Email email = new Email();
         
	        System.out.println("send mail 로 호출 호출 호출 호출");
	        String reciver = "xxoo246@gmail.com"; //받을사람의 이메일
	        String subject = "[StarPlanner][매니저 승인 요청]";
	        String content = "아이디 [ " + member.getM_id() + "]님이  [" + member.getTem_group() + "] 소속사의 매니저로 승인 요청 하였습니다";
	        
	        email.setReciver(reciver);
	        email.setSubject(subject);
	        email.setContent(content);
	         
	        emailSender.SendEmail(email);
	 
		
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
		session.setAttribute("groupId", mem.getGroup_id());
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
	//mypage에서 사용할 게시판글 목록 서치
	@RequestMapping("/searchBoardList")
	@ResponseBody
	public List<MyPage> searchBoardListbyMemberId(String m_id,String page) throws IOException{
		System.out.println(m_id);
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("m_id", m_id);
		map.put("page", "1");
		List<MyPage> list = memberService.selectBoardListByMemberId(map);
		System.out.println(list);
		return list;
	}
	@RequestMapping("/searchCommentList")
	@ResponseBody
	public List<MyPage> searchCommentListbyMemberId(String m_id,String page) throws IOException{
		System.out.println(m_id);
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("m_id", m_id);
		map.put("page", "1");
		List<MyPage> list = memberService.selectCommentListByMemberId(map);
		System.out.println("commnet-" + list);
		return list;
	}
	//mypage comment delete
	
	@RequestMapping("/deleteMyComment")
	public ModelAndView deleteMyComment(int comment_id ){
		System.out.println("deleteComment");
		commentService.deleteComment(comment_id);
		return new ModelAndView("member/member_mypage.tiles");
	}
	@RequestMapping("/deleteMyBoard")
	public ModelAndView deleteMyBoard(int board_no){
		System.out.println("deleteComment");
		boardService.removeByNo(board_no);
		return new ModelAndView("member/member_mypage.tiles");
	}
}
