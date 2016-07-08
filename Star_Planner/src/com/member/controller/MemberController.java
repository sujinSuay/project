package com.member.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.service.BoardService;
import com.board.service.CommentService;
import com.common.vo.Email;
import com.common.vo.Singer;
import com.member.service.AdminServiceImpl;
import com.member.service.MemberService;
import com.member.vo.Member;
import com.member.vo.MyPage;
import com.schedule.vo.Schedule;


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
		return new ModelAndView("member/member_join.tiles","groupList",list);
	}
	@RequestMapping("/join")
	public ModelAndView joinMember(@ModelAttribute Member member, String[] member_address, String tem_group2) throws Exception{
		String[] temSocial = member.getSocial_no().split(",");
		member.setSocial_no(temSocial[0]+"-"+temSocial[1]);
		if(member.getTem_group().equals("기타")){
			member.setTem_group(tem_group2);
		}
		member.setAddress(member_address[0]+"."+member_address[1]+"."+member_address[2]);
		member.setFavoriteList(member.getFavorite());
		memberService.insertMember(member);
		
		//이메일 보내주기 위한 로직 호출
		if(member.getGroup_id() == 3){
			Email email = new Email();
	        String reciver = "kdg360360@gmail.com"; //받을사람의 이메일
	        String subject = "[StarPlanner][매니저 승인 요청]";
	        String content = "아이디 [ " + member.getM_id() + "]님이  [" + member.getTem_group() + "] 소속사의 매니저로 승인 요청 하였습니다";
	        email.setReciver(reciver);
	        email.setSubject(subject);
	        email.setContent(content);
	        emailSender.SendEmail(email);
		}
		
		return new ModelAndView("redirect:/main/home.do");
	}
	@RequestMapping("/checkId")
	@ResponseBody
	public String checkId(String m_id) throws IOException{
		Member mem = memberService.getMemberById(m_id);
		if(mem==null) return "false"; else return "true"; 
	}
	@RequestMapping("/checkSocial_no")
	@ResponseBody
	public String checkSocial_no(String social_nos) throws IOException{
		String[] tem = social_nos.split(",");
		try{
			System.out.println(tem[0] + ","  +  tem[1]);
			int test = Integer.parseInt(tem[0]);
			test = Integer.parseInt(tem[1]);
		}catch(NumberFormatException e){
			return "numberFormat";
		}
		String social_no = tem[0] + "-" + tem[1];
		Member mem = memberService.getMemberBySocial_no(social_no);
		if(mem==null) return "false"; else return "true"; 
	}
	@RequestMapping("/login")
	@ResponseBody
	public ModelAndView login(String m_id, String password, HttpSession session) throws IOException{
		Member mem = memberService.loginMember(m_id, password);
		if(mem==null){
			return new ModelAndView("redirect:/member_login.do","m_id",m_id);
		}else if(mem.getActive().equals("true")){
			session.setAttribute("loginId", mem.getM_id());
			session.setAttribute("groupId", mem.getGroup_id());
			return new ModelAndView("/main/home.do");
		} else {
			return new ModelAndView("redirect:/member_login.do","m_id",m_id);
		}
		
	}
	@RequestMapping("/logout")
	public ModelAndView login(HttpSession session){
		session.invalidate();
		return new ModelAndView("/main/home.do");
	}
	
	@RequestMapping("/mypage")
	public ModelAndView mypage(HttpSession session) throws IOException{
		if(session.getAttribute("loginId")==null){
			return new ModelAndView("/main.do","errors","로그인을 해주세요.");
		} 
		Member mem = memberService.getMemberById((String)session.getAttribute("loginId"));
		return new ModelAndView("member/member_mypage.tiles","member",mem);
	}
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(HttpSession session) throws IOException{
		if(session.getAttribute("loginId")==null){
			return new ModelAndView("/main.do","errors","로그인을 해주세요.");
		} 
	
		Member mem = memberService.getMemberById((String)session.getAttribute("loginId"));
		String[] addr = mem.getAddress().split("\\.");
		if(mem.getFavorite()!=null) {
			mem.setFavoriteList(mem.getFavorite());
		}
		Map<String, Object> list = new HashMap<>();
		list.put("member", mem);
		list.put("temAdr",addr);
		return new ModelAndView("member/member_modify.tiles", list);
		
	}
	@RequestMapping("/modify")
	public ModelAndView modify(String m_id, String password, String email, String phone, String gender, String[] member_address, String favorite) throws IOException{
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("password", password);
		map.put("email", email);
		map.put("phone", phone);
		map.put("m_id", m_id);
		map.put("address", member_address[0]+"."+member_address[1]+"."+member_address[2]);
		map.put("gender", gender);
		map.put("favorite", favorite);
		memberService.updateMemberById(map);
		return new ModelAndView("redirect:/member/mypage.do");
	}
	//mypage에서 사용할 게시판글 목록 서치
	@RequestMapping("/searchBoardList")
	@ResponseBody
	public List<MyPage> searchBoardListbyMemberId(String m_id,String page) throws IOException{
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("m_id", m_id);
		map.put("page", "1");
		List<MyPage> list = memberService.selectBoardListByMemberId(map);
		return list;
	}
	@RequestMapping("/searchCommentList")
	@ResponseBody
	public List<MyPage> searchCommentListbyMemberId(String m_id,String page) throws IOException{
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("m_id", m_id);
		map.put("page", "1");
		List<MyPage> list = memberService.selectCommentListByMemberId(map);
		return list;
	}
	//mypage comment delete
	
	@RequestMapping("/deleteMyComment")
	public ModelAndView deleteMyComment(int comment_id ){
		commentService.deleteComment(comment_id);
		return new ModelAndView("member/member_mypage.tiles");
	}
	@RequestMapping("/deleteMyBoard")
	public ModelAndView deleteMyBoard(int board_no){
		boardService.removeByNo(board_no);
		return new ModelAndView("member/member_mypage.tiles");
	}
	
	@RequestMapping("/searchScheduleById")
	@ResponseBody
	public List<Schedule> selectScheduleByMemberId(String m_id){
		Date d = new Date();
		String schedule_start = (d.getYear()+1900) + "-" + String.format("%02d", (d.getMonth()+1)) + "-" + String.format("%02d", d.getDate())+
				"T" + String.format("%02d", d.getHours()) + ":" + String.format("%02d", d.getMinutes());
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("schedule_start", schedule_start);
		map.put("m_id", m_id);
		List<Schedule> list = memberService.selectScheduleByMemberId(map);
		return list;
	}
	@RequestMapping("/searchScheduleByGroup")
	@ResponseBody
	public List<Schedule> selectScheduleByGroup(String group_id){
		Date d = new Date();
		String schedule_start = (d.getYear()+1900) + "-" + String.format("%02d", (d.getMonth()+1)) + "-" + String.format("%02d", d.getDate())+
				"T" + String.format("%02d", d.getHours()) + ":" + String.format("%02d", d.getMinutes());
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("schedule_start", schedule_start);
		map.put("group_id", group_id);
		List<Schedule> list = memberService.selectScheduleByGroup(map);
		return list;
	}
	//searchSinger
	@RequestMapping("/searchSinger")
	@ResponseBody
	public List<Singer> selectSingerIdandName(String keyword){
		List<Singer> list= memberService.selectSingerIdandName(keyword);
		return list;
	}
	@RequestMapping("/plusSingerFavorite")
	@ResponseBody
	public String plusSingerFavorite(String singer_id){
		memberService.plusSingerFavorite(singer_id);
		return singer_id;
	}
	@RequestMapping("/minusSingerFavorite")
	@ResponseBody
	public String minusSingerFavorite(String singer_id){
		memberService.minusSingerFavorite(singer_id);
		return singer_id;
	}
	@RequestMapping("/inactiveMemberForm")
	public ModelAndView inactiveMemberForm(){
		System.out.println("inactiveMemberForm");
		return new ModelAndView("member/inactiveMemberForm.tiles");
	}
	@RequestMapping("/inactiveMember")
	@ResponseBody
	public String checkPasswordAndId(String m_id, String password){
		System.out.println("inactiveMember()" + m_id + " / " + password);
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("m_id", m_id);
		map.put("password", password);
		Member mem = memberService.checkPasswordAndId(map);
		if(mem==null)
			return "false";
		else 
			memberService.inactiveMemberById(mem);
			return "true";
	}
}
