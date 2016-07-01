package com.member.dao;

import java.util.HashMap;
import java.util.List;

import com.board.vo.Board;
import com.member.vo.Member;
import com.member.vo.MyPage;
import com.schedule.vo.Schedule;

public interface memberDao {

	int insertMember(Member member);
	Member selectMemberById(String m_id);
	Member selectMemberByIdAndPassword(String m_id, String password);
	int updateMemberById(HashMap<String, String> map);
	String selectFavorite(String m_id);
	List<String> selectGroupList();
	List<MyPage> selectBoardListByMemberId(HashMap<String, String> map);
	List<MyPage> selectCommentListByMemberId(HashMap<String, String> map);
	List<Schedule> selectScheduleByMemberId(HashMap<String, String> map);
	List<Schedule> selectScheduleByGroup(HashMap<String, String> map);

}