package com.member.dao;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.common.vo.Group;
import com.common.vo.LinkList;
import com.common.vo.Singer;
import com.member.vo.ManagerList;
import com.member.vo.Member;
import com.member.vo.SingerList;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSessionTemplate session;


	/** 관리자로 등록된 회원 리스트  **/
	public List<Member> selectAdmin() {
	
		System.out.println("##AdminDaoImp + SelectAdmin()");
		return session.selectList("admin.selectAdmin");
	}

	
	
	//관리자로 등록
	public int insertAdmin(String m_id) {
		
		System.out.println("##AdminDaoImp + insertAdmin()");
		
		return session.update("admin.insertAdmin", m_id);
	}

	
	//관리자 해제
	@Override
	public int deleteAdmin(String m_id) {
		System.out.println("##AdminDaoImp + deleteAdmin()");
		
		return session.update("admin.deleteAdmin", m_id);
	}



	//매니저 목록 조회
	@Override
	public List<Member> selectManager() {
		System.out.println("##AdminDaoImp + selectManager()");
		
		return session.selectList("admin.selectManager");
	}



	//매니저 등록
	@Override
	public int insertManager(HashMap<String, Object> map) {
		
		System.out.println("##AdminDaoImp + insertManager(" +map + ")");
		System.out.println("$$$$" + map);
		int c =session.update("admin.insertManager", map);
		return c;
	}

	
	//매니저 등록 거절
	@Override
	public int denyManager(String m_id) {
		System.out.println("##AdminDaoImp + denyManager()");
		return session.update("admin.denyManager", m_id);
	}


	//매니저  삭제
	@Override
	public int deleteManager(String m_id) {
		//사용하지 않는 함수 - 혹시 추후 사용될까봐 냅둠
		System.out.println("##AdminDaoImp + deleteManager(" + m_id +")");
		
		return 0;
	}

	public List<ManagerList> selectManagerList(String id){
		System.out.println("##AdminDaoImp + selectManagerList(" + id  +")");
		if(id==null || id.equals("회사 분류")){ //전체조회
			return session.selectList("admin.selectManagerAllList");
		}else{ //검색한 키워드로 조회
			return session.selectList("admin.selectManagerByCompany", id);
		}
	}

	//가수 분류 조회
	@Override
	public List<String> selectSingerType() {
		System.out.println("##AdminDaoImp + selectSingerType()");
		
		
		return session.selectList("admin.selectSingerType");
	}
	
	


	//가수 회사 조회
	@Override
	public List<String> selectSingerCompany() {
		System.out.println("##AdminDaoImp + selectSingerCompany()");
		
		
		return session.selectList("admin.selectSingerCompany");
	}



	@Override
	public int selectGroupIdByName(String name) {
		
		System.out.println("##AdminDaoImp + selectGroupIdByName()");
		
		return session.selectOne("admin.selectGroupIdByName", name);
	}



	@Override
	public int selectSingerId() {
		
		System.out.println("##AdminDaoImp + selectSingerId()");
		return session.selectOne("admin.selectSingerId");
				
	}
	
	//가수 등록
	public int insertSinger(Singer singer){
		System.out.println("##AdminDaoImp + insertSinger()");
		return session.update("admin.insertSinger", singer);
	}

	//가수 목록 조회
	public List<SingerList> selectSingerList(String id){
		System.out.println("##AdminDaoImp + selectSingerList()");
		if(id==null ||id.equals("가수분류")){
			return session.selectList("admin.selectSingerListAll");
		}else{
			return session.selectList("admin.selectSingerList", id);
		}
		
	}


	//회사 등록
	@Override
	public int insertCompany(Group group) {
		System.out.println("##AdminDaoImp + insertCompany()");

		return session.insert("admin.insertCompany", group);
	}
	
	//회사 목록 조회
	public List<Group> selectGroupAll(){
		System.out.println("##AdminDaoImp + selectGroupAll()");
		return session.selectList("admin.selectGroupAll");
	}
	
	
	public int insertMainLink(HashMap<String, Object> map){
		System.out.println("##AdminDaoImp + insertMainLink()");
		return session.insert("admin.insertMainLink", map);
		
	}



	public int deleteMainLink(int count) {
		System.out.println("##AdminDaoImp + deleteMainLink()");
		return session.update("admin.deleteMainLink", count);
	}
	
	//메인화면 링크 조회
	public List<String> selectMainLink(){
		System.out.println("##AdminDaoImp + selectMainLink()");
		return session.selectList("admin.selectMainLink");
		
	}



	




}
