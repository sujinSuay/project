package com.member.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.member.dao.MemberDaoImpl;
import com.member.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDaoImpl memberDao;
	
	public Member getMemberById(String m_id) throws IOException{
		return memberDao.selectMemberById(m_id);
	}
	public int insertMember(Member member) throws IOException{
		return memberDao.insertMember(member);
	}
}
