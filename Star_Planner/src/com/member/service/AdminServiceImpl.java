package com.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.vo.Group;
import com.common.vo.LinkList;
import com.common.vo.Singer;
import com.member.dao.AdminDaoImpl;
import com.member.dao.MemberDaoImpl;
import com.member.vo.ManagerList;
import com.member.vo.Member;
import com.member.vo.SingerList;

@Service("adminService")
public class AdminServiceImpl {

	@Autowired
	private AdminDaoImpl adminDao;

	@Autowired
	private MemberDaoImpl memberDao;

	public List<Member> getAdminList() {

		return adminDao.selectAdmin();
	}

	public Member selectById(String id) {

		return memberDao.selectMemberById(id);

	}

	public int insertAdmin(String id) {
		// 디비의 member의 group_id 정보를 수정
		return adminDao.insertAdmin(id);
	}

	public List<Member> deleteAdmin(String m_id) {
		adminDao.deleteAdmin(m_id);
		return adminDao.selectAdmin();

	}

	// 매니저로 신청한 목록을 조회
	public List<Member> selectManager() {
		return adminDao.selectManager();
	}

	// 매니저로 승낙
	public int insertManager(String id, String group_name) {
		int group_id = adminDao.selectGroupIdByName(group_name);

		// 디비의 member의 group_id 정보를 수정

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", id);
		map.put("group_id", group_id);

		return adminDao.insertManager(map);
	}

	// 매니저로 승낙 거절
	public int denyManager(String m_id) {
		return adminDao.denyManager(m_id);
	}

	// 매니저(이미 매니저가 된) 리스트 조회
	public List<ManagerList> selectManagerList(String id) {
		return adminDao.selectManagerList(id);
	}

	// 가수등록 - 가수 분류 selector
	public List<String> selectSingerType() {
		return adminDao.selectSingerType();
	}

	// 가수등록 - 가수 회사 selecotr
	public List<String> selectSingerCompany() {
		return adminDao.selectSingerCompany();
	}

	// 가수 등록
	public int insertSinger(String singer_name, String singer_type, String singer_company, String singer_link,
			String singer_tag) {
		// 가수의 소속사 id
		int group_id = adminDao.selectGroupIdByName(singer_company);

		// 가수의 id 값 조회
		int singer_id = adminDao.selectSingerId();

		Singer singer = new Singer(singer_id, singer_name, group_id, singer_type, singer_link, 0, singer_tag);

		return adminDao.insertSinger(singer);
	}

	// 가수 목록 조회
	public List<SingerList> selectSingerList(String id) {
		return adminDao.selectSingerList(id);
	}

	// 회사 등록
	public int insertCompany(String group_name, String group_address, String group_phone, String group_link) {
		// 회사 등록
		Group group = new Group(0, group_name, group_address, group_phone, group_link);
		return adminDao.insertCompany(group);
	}

	public List<Group> selectGroupAll() {
		return adminDao.selectGroupAll();
	}

	// 링크 등록
	public int insertMainLink(int count, String input, String input_explain) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("input", input);
		map.put("input_explain", input_explain);
		return adminDao.insertMainLink(map);
	}

	// 링크 삭제
	public int deleteMainLink(int count) {
		return adminDao.deleteMainLink(count);
	}

	// 링크조회
	public List<LinkList> selectMainLink() {
		return adminDao.selectMainLink();
	}

}
