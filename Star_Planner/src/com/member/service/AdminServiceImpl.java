package com.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.vo.Group;
import com.common.vo.Singer;

import com.member.dao.AdminDaoImpl;
import com.member.dao.MemberDaoImpl;
import com.member.vo.Member;


@Service("adminService")
public class AdminServiceImpl {

	@Autowired
	private AdminDaoImpl adminDao;
	
	@Autowired
	private MemberDaoImpl memberDao;
	
	public List<Member> getAdminList(){
		
		return adminDao.selectAdmin();
	}
	
	public Member selectById(String id){
		
		return memberDao.selectMemberById(id);
		
	}
	
	
	public int insertAdmin(String id){

		System.out.println("##AdminServiceImpl insetAdmin(" + id + ")");
		
		//디비의 member의 group_id 정보를 수정
		return adminDao.insertAdmin(id);
	}
	
	public List<Member> deleteAdmin(String m_id){
		
		System.out.println("##AdminServiceImpl deleteAdmin(" + m_id + ")");
		
		adminDao.deleteAdmin(m_id);
		
		return adminDao.selectAdmin();
		
	}
	
	//매니저로 신청한 목록을 조회
	public List<Member> selectManager(){
		
		System.out.println("##AdminServiceImpl selectManager()");
		return adminDao.selectManager();
	}
	
	//매니저로 승낙
	public int insertManager(String id){

		System.out.println("##AdminServiceImpl insertManagers(" + id + ")");
		
		//디비의 member의 group_id 정보를 수정
		return adminDao.insertAdmin(id);
	}
	
	
	//가수등록 - 가수 분류 selector
	public List<String> selectSingerType(){
		
		System.out.println("##AdminServiceImpl selectSingerType()");
		return adminDao.selectSingerType();
	}
	
	//가수등록 - 가수 회사 selecotr
	public List<String> selectSingerCompany(){
		
		System.out.println("##AdminServiceImpl selectSingerCompany()");
		return adminDao.selectSingerCompany();
	}
	
	public int insertSinger(String singer_name, String singer_type, String singer_company, String singer_link, String singer_tag){
		
		System.out.println("##AdminServiceImpl insertSinger()");
		//가수의 소속사 id 
		int group_id = adminDao.selectGroupIdByName(singer_company);
		
		//가수의 id 값 조회
		int singer_id = adminDao.selectSingerId();
		
		Singer singer = new Singer(singer_id, singer_name, group_id, singer_type, singer_link, 0, singer_tag);
		System.out.println("%%%" + singer);
		int test = adminDao.insertSinger(singer);
		System.out.println("ggg "+ test);
		
		return 0;
	}

	public int insertCompany(String group_name, String group_address, String group_phone, String group_link) {
		
		System.out.println("##AdminServiceImpl insertCompany()");
		
		//회사 등록
		Group group = new Group(0, group_name, group_address, group_phone, group_link);
		return adminDao.insertCompany(group);
		
	}
	
}
