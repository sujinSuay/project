package com.member.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.vo.Board;
import com.common.vo.Singer;
import com.member.vo.Member;
import com.member.vo.MyPage;
import com.schedule.vo.Schedule;

@Repository
public class MemberDaoImpl implements memberDao {
	
	@Autowired
	private SqlSessionTemplate session;
/*	public MemberDaoImpl(SqlSessionTemplate session){
		this.session = session;
	}*/
	/* (non-Javadoc)
	 * @see com.member.dao.memberDao2#insertMember(com.member.vo.Member)
	 */
	@Override
	public int insertMember(Member member){
		return session.insert("member.insertMember", member);
	}
	/* (non-Javadoc)
	 * @see com.member.dao.memberDao2#selectMemberById(java.lang.String)
	 */
	@Override
	public Member selectMemberById(String m_id){
		return session.selectOne("member.selectMemberById", m_id);
	}
	/* (non-Javadoc)
	 * @see com.member.dao.memberDao2#selectMemberByIdAndPassword(java.lang.String, java.lang.String)
	 */
	@Override
	public Member selectMemberByIdAndPassword(String m_id, String password){

		HashMap<String, String> map = new HashMap<String,String>();
		map.put("m_id", m_id);
		map.put("password", password);
		return session.selectOne("member.selectMemberByIdAndPassword",map);
	}
	/* (non-Javadoc)
	 * @see com.member.dao.memberDao2#updateMemberById(java.util.HashMap)
	 */
	@Override
	public int updateMemberById(HashMap<String, Object> map){
		return session.update("member.updateMemberById", map);
	}
	/* (non-Javadoc)
	 * @see com.member.dao.memberDao2#selectFavorite(java.lang.String)
	 */
	@Override
	public String selectFavorite(String m_id){
		String fav = session.selectOne("member.selectFavorite", m_id);
		if(fav==null){
			return "";
		}else{
			return fav;
		}
	}
	/* (non-Javadoc)
	 * @see com.member.dao.memberDao2#selectGroupList()
	 */
	@Override
	public List<String> selectGroupList(){
		return session.selectList("common.selectGroupList");
	}
	@Override
	public List<MyPage> selectBoardListByMemberId(HashMap<String, String> map){
		return session.selectList("board.selectBoardListByMemberId", map);
	}
	@Override
	public List<MyPage> selectCommentListByMemberId(HashMap<String, String> map){
		return session.selectList("comment.selectCommentListByMemberId", map);
	}
	@Override
	public List<Schedule> selectScheduleByMemberId(HashMap<String, String> map){
		int groupId=session.selectOne("member.selectGroupId",map.get("m_id"));
		if( groupId >= 10){
			return session.selectList("schedule.selectScheduleByMemberId", map);
		} return session.selectList("schedule.selectScheduleByAdminId", map);
	}
	@Override
	public List<Schedule> selectScheduleByGroup(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		if(Integer.parseInt(map.get("group_id")) >= 10){
			return session.selectList("schedule.selectScheduleByGroup2", map);
		} else return session.selectList("schedule.selectAllScheduleByAdminId", map.get("schedule_start"));
	}
	@Override
	public List<Singer> selectSingerIdandName(String keyword) {
		// TODO Auto-generated method stub
		return session.selectList("singer.selectSingerIdandName",keyword);
	}
	@Override
	public void plusSingerFavorite(String singer_id) {
		// TODO Auto-generated method stub
		session.update("singer.plusSingerFavorite",singer_id);
	}
	@Override
	public void minusSingerFavorite(String id) {
		// TODO Auto-generated method stub
		int count;
		String singer_id;
		if(isNumber(id))
			singer_id=id;
		else singer_id = session.selectOne("singer.selectSingerIdByName",id);
		
		count = session.selectOne("singer.selectSingerFavortieCount",singer_id);
		if(count>=1) count--;
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("singer_id", singer_id);
		map.put("singer_favorite", count);
		System.out.println(map);
		session.update("singer.updateSingerFavorite",map);
		System.out.println(singer_id + "/" + count);
		
	}
	private boolean isNumber(String singer_id) {
		try{
			Integer.parseInt(singer_id);
			return true;
		} catch (NumberFormatException e){
			return false;
		}
	}
	@Override
	public Member getMemberBySocial_no(String social_no) {
		return session.selectOne("member.selectMemberBySocial_no",social_no);
	}
	@Override
	public Member checkPasswordAndId(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectOne("member.checkPasswordAndId",map);
	}
	@Override
	public int inactiveMemberById(Member mem) {
		// TODO Auto-generated method stub
		return session.update("member.inactiveMemberById",mem);
	}
}
