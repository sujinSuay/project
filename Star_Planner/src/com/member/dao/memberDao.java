package com.member.dao;

import java.util.HashMap;
import java.util.List;

import com.member.vo.Member;

public interface memberDao {

	int insertMember(Member member);
	Member selectMemberById(String m_id);
	Member selectMemberByIdAndPassword(String m_id, String password);
	int updateMemberById(HashMap<String, String> map);
	String selectFavorite(String m_id);
	List<String> selectGroupList();

}