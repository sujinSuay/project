package com.member.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.common.vo.Group;
import com.common.vo.Singer;
import com.member.service.AdminServiceImpl;
import com.member.vo.ManagerList;
import com.member.vo.Member;
import com.member.vo.SingerList;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	
	@Autowired
	AdminServiceImpl adminService;
	
	@RequestMapping("/adminMain")
	@ResponseBody
	public ModelAndView AdminMain(){
		
		System.out.println("##AdminController + AdminMain()");
		HashMap<String,Object> map = new HashMap<String, Object>();
		
		//관리자 목록
		List<Member> list_admin = adminService.getAdminList();
		System.out.println(list_admin);
		map.put("list_admin", list_admin);
		
		//매니저 목록
		List<Member> list_manager = adminService.selectManager();
		System.out.println(list_manager);
		map.put("list_manager", list_manager);
		
		
		//가수등록 - 가수 분류 selector 
		List<String> list_singerType = adminService.selectSingerType();
		System.out.println(list_singerType);
		map.put("list_singerType", list_singerType);
		
		//가수등록 - 가수 회사 selecotr
		List<String> list_singerCompany = adminService.selectSingerCompany();
		System.out.println(list_singerCompany);
		map.put("list_singerCompany", list_singerCompany);
		
		//메인화면 링크 조회
		List<String> list_mainLink = adminService.selectMainLink();
		System.out.println(list_mainLink);
		map.put("list_mainLink", list_mainLink);
		
		//매니저 목록 전체 조회
		List<ManagerList> list_managerListAll = adminService.selectManagerList(null);
		System.out.println("list manager all " + list_managerListAll);
		map.put("list_managerAll", list_managerListAll);
		
		//가수 목록 조회
		List<SingerList> list_singerListAll = adminService.selectSingerList(null);
		System.out.println("list manager all " + list_singerListAll);
		map.put("list_singerListAll", list_singerListAll);

		//회사목록 조회
		List<Group> list_groupListAll = adminService.selectGroupAll();
		System.out.println(list_groupListAll);
		map.put("list_groupListAll", list_groupListAll);
		
 		
		return new ModelAndView("/admin/admin_main.do" ,map);
		
		
	}
	
	
	
	@RequestMapping("/selectById")
	@ResponseBody
	public Member SelectAdminById(String id){
		System.out.println("##AdminController + SelectAdminById()" );
		
		Member member = adminService.selectById(id);
		System.out.println("##selectById member "  + member);
		
		
		//select 된 결과가 없을 시 json에러 발생, 입력한 값의 회원이 없을경우 member객체를 생성
		//json에러 방지와 member의 length=0임을 이용해서 exception처리를 해주기 위한 용도
		if(member==null){
			member = new Member(); 
			System.out.println("입력한 회원 아이디가 존재하지 않습니다");
		}
		
		
		return member;
	}
	
	
	
	//검색한 회원을 등록
	@RequestMapping("/register")
	@ResponseBody
	public List<Member> Register(String id){
		
		System.out.println("##AdminController + Register("+id+")");
		
		adminService.insertAdmin(id);
		
		System.out.println("@@AdminController + Register ");
		
		List<Member> list = adminService.getAdminList();
		return list;
		
	}
	

	@RequestMapping("/delete")
	@ResponseBody
	public List<Member> DeleteAdmin(String m_id){
		
		System.out.println("##AdminController + DeleteAdmin()");
		List<Member> list = adminService.deleteAdmin(m_id);
		System.out.println("##" + list);
		return list;
		
	}
	

	

	@RequestMapping("/insertManager")
	@ResponseBody
	public List<Member> insertManager(String m_id, String group_name){
		
		System.out.println("##AdminController + insertManager(" + m_id +")");
		
		//추가하는 부분
		
		List<Member> list = adminService.selectManager();
		System.out.println("매니저 목록 : " +list);
		
		//매니저 추가
		adminService.insertManager(m_id, group_name);
		
		return list;
	}
	
	//매니저 등록 거절
	@RequestMapping("/denyManager")
	@ResponseBody
	public List<Member> denyManager(String m_id){
		
		System.out.println("##AdminController + denyManager(" + m_id +")");
		 adminService.denyManager(m_id);
		 
		 List<Member> list = adminService.selectManager();
		 return list;
	}
	
	//매니저 목록 키워드로 조회
	@RequestMapping("/selectManagerByCompany")
	@ResponseBody
	public List<ManagerList> selectManagerByCompany(String id){
		System.out.println("##AdminController + selectManagerList(" + id +")");
		List<ManagerList> list = adminService.selectManagerList(id);
		System.out.println("###"+list);
		return list;
		
	}
	
	
	
	//가수등록
	@RequestMapping("/insertSinger")
	@ResponseBody
	public int insertSinger(String singer_name, String singer_type, String singer_company, String singer_link, String singer_tag){
		
		System.out.println("##AdminController + insertSinger()");
		return adminService.insertSinger(singer_name, singer_type, singer_company, singer_link, singer_tag);
		
	}
	
	
	//가수 목록 키워드로 조회
	@RequestMapping("/selectSingerList")
	@ResponseBody
	public List<SingerList> selectSingerList(String id){
		System.out.println("##AdminController + selectSingerList()");
		
		List<SingerList> list = adminService.selectSingerList(id);
		System.out.println("$$"+list);
		return list;
	}
	
	
	//회사등록
	@RequestMapping("/insertCompany")
	@ResponseBody
	public int insertCompany(String group_name, String group_address, String group_phone, String group_link){
		
		System.out.println("##AdminController + insertSinger()");
		return adminService.insertCompany(group_name, group_address, group_phone, group_link);
	
	}
	
	
	//메인화면의 링크 추가
	@RequestMapping("/insertMainLink")
	@ResponseBody
	public int insertMainLink(int count, String input){
		
		System.out.println("##AdminController + insertMainLink()");
		return adminService.insertMainLink(count, input);
	
	}
	
	//메인화면의 링크 삭제
		@RequestMapping("/deleteMainLink")
		@ResponseBody
		public int deleteMainLink(int count){
			
			System.out.println("##AdminController + deleteMainLink()");
			return adminService.deleteMainLink(count);
		
		}
	
	
	
	
	
	
}
