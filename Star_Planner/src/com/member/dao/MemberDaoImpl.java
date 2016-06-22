package com.member.dao;


import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
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
	public int updateMemberById(HashMap<String, String> map){
		return session.update("member.updateMemberById", map);
	}
}
