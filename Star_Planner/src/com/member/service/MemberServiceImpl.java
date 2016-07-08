package com.member.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.board.vo.Board;
import com.common.vo.Singer;
import com.member.dao.MemberDaoImpl;
import com.member.vo.Member;
import com.member.vo.MyPage;
import com.schedule.vo.Schedule;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDaoImpl memberDao;
	
	/* (non-Javadoc)
	 * @see com.member.service.mms2#getMemberById(java.lang.String)
	 */
	@Override
	public Member getMemberById(String m_id) throws IOException{
		return memberDao.selectMemberById(m_id);
	}
	/* (non-Javadoc)
	 * @see com.member.service.mms2#insertMember(com.member.vo.Member)
	 */
	@Override
	public int insertMember(Member member) throws IOException{
		return memberDao.insertMember(member);
	}
	/* (non-Javadoc)
	 * @see com.member.service.mms2#loginMember(java.lang.String, java.lang.String)
	 */
	@Override
	public Member loginMember(String m_id, String password) throws IOException{
		return memberDao.selectMemberByIdAndPassword(m_id, password);
	}
	/* (non-Javadoc)
	 * @see com.member.service.mms2#updateMemberById(java.util.HashMap)
	 */
	@Override
	public int updateMemberById(HashMap<String, String> map){
		return memberDao.updateMemberById(map);
		
	}
	/* (non-Javadoc)
	 * @see com.member.service.mms2#selectGroupList()
	 */
	@Override
	public List<String> selectGroupList(){
		return memberDao.selectGroupList();
	}
	@Override
	public List<MyPage> selectBoardListByMemberId(HashMap<String, String> map){
		return memberDao.selectBoardListByMemberId(map);
	}
	@Override
	public List<MyPage> selectCommentListByMemberId(HashMap<String, String> map){
		return memberDao.selectCommentListByMemberId(map);
	}
	@Override
	public List<Schedule> selectScheduleByMemberId(HashMap<String, String> map){
		return memberDao.selectScheduleByMemberId(map);
	}
	@Override
	public List<Schedule> selectScheduleByGroup(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return memberDao.selectScheduleByGroup(map);
	}
	@Override
	public List<Singer> selectSingerIdandName(String keyword) {
		// TODO Auto-generated method stub
		return memberDao.selectSingerIdandName(keyword);
	}
	@Override
	public void plusSingerFavorite(String singer_id) {
		// TODO Auto-generated method stub
		memberDao.plusSingerFavorite(singer_id);
	}
	@Override
	public void minusSingerFavorite(String singer_id) {
		// TODO Auto-generated method stub
		memberDao.minusSingerFavorite(singer_id);
	}
	@Override
	public Member getMemberBySocial_no(String social_no) {
		// TODO Auto-generated method stub
		return memberDao.getMemberBySocial_no(social_no);
	}
	@Override
	public Member checkPasswordAndId(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return memberDao.checkPasswordAndId(map);
	}
	@Override
	public int inactiveMemberById(Member mem) {
		// TODO Auto-generated method stub
		return memberDao.inactiveMemberById(mem);
	}
}
