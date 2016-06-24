package com.member.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import com.member.vo.Member;

public interface MemberService {
	Member getMemberById(String m_id) throws IOException;

	int insertMember(Member member) throws IOException;

	Member loginMember(String m_id, String password) throws IOException;

	int updateMemberById(HashMap<String, String> map);

	List<String> selectGroupList();
}
