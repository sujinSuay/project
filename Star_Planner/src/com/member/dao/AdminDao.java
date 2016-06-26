package com.member.dao;

import java.util.List;

import com.common.vo.Group;
import com.common.vo.Singer;
import com.member.vo.Member;

public interface AdminDao {
	
	//관리자 목록
	public List<Member> selectAdmin();
	
	//관리자 등록
	public int insertAdmin(String m_id);
	
	//관리자 삭제
	public int deleteAdmin(String m_id);
	
	//매니저 신청 목록
	public List<Member> selectManager();
	
	
	//매니저 등록
	public int insertManager(String m_id);
		
	//매니저 거절
	public int deleteManager(String m_id);
	
	//가수 분류 조회
	public List<String> selectSingerType();
	
	//가수 회사 조회
	public List<String> selectSingerCompany();
	
	//그룹이름으로 가수id 조회
	public int selectGroupIdByName(String name);
	
	//가수 id값 조회
	public int selectSingerId();
	
	//가수 등록
	public int insertSinger(Singer singer);
	
	//그룹 등록
	public int insertCompany(Group group);
	

}
