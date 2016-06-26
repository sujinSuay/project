package com.member.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.vo.Board;
import com.member.vo.Member;
import com.member.vo.MyPage;

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
	public int updateMemberById(HashMap<String, String> map){
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
}
