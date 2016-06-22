package com.member.dao;

import com.member.vo.Member;

public interface MemberDao {
	public int insertMember(Member member);
	public Member selectMemberById(String m_id);
	public Member selectMemberByIdAndPassword(String m_id, String password);
	public String selectFavorite(String m_id);
}
