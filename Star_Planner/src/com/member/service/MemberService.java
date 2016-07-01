package com.member.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import com.board.vo.Board;
import com.member.vo.Member;
import com.member.vo.MyPage;
import com.schedule.vo.Schedule;

public interface MemberService {
	Member getMemberById(String m_id) throws IOException;
	int insertMember(Member member) throws IOException;
	Member loginMember(String m_id, String password) throws IOException;
	int updateMemberById(HashMap<String, String> map);
	List<String> selectGroupList();
	List<MyPage> selectBoardListByMemberId(HashMap<String, String> map);
	List<MyPage> selectCommentListByMemberId(HashMap<String, String> map);
	List<Schedule> selectScheduleByGroup(HashMap<String, String> map);
	List<Schedule> selectScheduleByMemberId(HashMap<String, String> map);
}
