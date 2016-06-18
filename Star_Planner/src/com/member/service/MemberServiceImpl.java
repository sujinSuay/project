package com.member.service;

import java.io.IOException;


import com.member.dao.MemberDaoImpl;
import com.member.vo.Member;

public class MemberServiceImpl implements MemberService{
	
	private MemberDaoImpl memberDao;
	
	public String getMemberById(String m_id) throws IOException{
		Member member = memberDao.selectMemberById(m_id);
		return null;
	}
}
