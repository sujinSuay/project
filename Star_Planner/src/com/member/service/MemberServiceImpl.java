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
	
	public String getMemberById(String m_id) throws IOException{
		Member member = memberDao.selectMemberById(m_id);
		return null;
	}
	public int insertMember(Member member) throws IOException{
		return memberDao.insertMember(member);
	}
}
