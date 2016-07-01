package com.member.dao;

import java.util.HashMap;
import java.util.List;

import com.common.vo.Group;
import com.common.vo.LinkList;
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
	public int insertManager(HashMap<String, Object> map);
	
	//매니저 거절
	public int denyManager(String m_id);
	
		
	//매니저 삭제
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
	
	//메인화면 링크 등록
	public int insertMainLink(HashMap<String, Object> map);
	
	//메인화면 링크 삭제
	public int deleteMainLink(int count);
	
	//메인화면 링크 조회
	public List<LinkList> selectMainLink();

}
