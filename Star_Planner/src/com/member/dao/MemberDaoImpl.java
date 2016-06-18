package com.member.dao;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.member.vo.Member;

public class MemberDaoImpl implements MemberDao {
	private static MemberDaoImpl instance;
	private SqlSessionFactory factory;
	
/*	public static MemberDaoImpl getInstance() throws IOException{
		if(instance == null)
			instance = new MemberDaoImpl();
		return instance;
	}*/
	public int insertMember(Member member){
		SqlSession session = factory.openSession();
		try {
			int cnt = session.insert("member.insertMember", member);
			session.commit();
			return cnt;
		} finally {
			session.close();
		}
	}
	public Member selectMemberById(String m_id){
		SqlSession session = factory.openSession();
		try {
			Member member = session.selectOne("member.selectMemberById", m_id);
			return member;
		} finally {
			session.close();
		}
		
		
	}
}
