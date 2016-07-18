package com.member.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import com.board.vo.Board;
import com.common.vo.Singer;
import com.member.vo.Member;
import com.member.vo.MyPage;
import com.schedule.vo.Schedule;

public interface MemberService {
	Member getMemberById(String m_id) throws IOException;
	int insertMember(Member member) throws IOException;
	Member loginMember(String m_id, String password) throws IOException;
	int updateMemberById(HashMap<String, Object> map);
	List<String> selectGroupList();
	List<MyPage> selectBoardListByMemberId(HashMap<String, String> map);
	List<MyPage> selectCommentListByMemberId(HashMap<String, String> map);
	List<Schedule> selectScheduleByGroup(HashMap<String, String> map);
	List<Schedule> selectScheduleByMemberId(HashMap<String, String> map);
	List<Singer> selectSingerIdandName(String keyword);
	void plusSingerFavorite(String singer_id);
	void minusSingerFavorite(String singer_id);
	Member getMemberBySocial_no(String social_no);
	Member checkPasswordAndId(HashMap<String, String> map);
	int inactiveMemberById(Member mem);
	List<Member> selectMemberByName(String name);
}
