package com.member.dao;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

import com.member.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	private SqlSessionTemplate session;
	public MemberDaoImpl(SqlSessionTemplate session){
		this.session = session;
	}
	public int insertMember(Member member){
		return session.insert("member.insertMember", member);
	}
	public Member selectMemberById(String m_id){
		return session.selectOne("member.selectMemberById", m_id);
	}
}
