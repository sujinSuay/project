package com.member.dao;


import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.member.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate session;
/*	public MemberDaoImpl(SqlSessionTemplate session){
		this.session = session;
	}*/
	public int insertMember(Member member){
		return session.insert("member.insertMember", member);
	}
	public Member selectMemberById(String m_id){
		return session.selectOne("member.selectMemberById", m_id);
	}
	public Member selectMemberByIdAndPassword(String m_id, String password){

		HashMap<String, String> map = new HashMap<String,String>();
		map.put("m_id", m_id);
		map.put("password", password);
		return session.selectOne("member.selectMemberByIdAndPassword",map);
	}
	public String selectFavorite(String m_id){
		String fav = session.selectOne("member.selectFavorite", m_id);
		if(fav==null){
			return "";
		}else{
			return fav;
		}
		 
	}
	
}
