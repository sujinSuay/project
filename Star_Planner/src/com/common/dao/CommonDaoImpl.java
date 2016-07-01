package com.common.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.common.vo.Group;
import com.common.vo.SearchData;
import com.common.vo.Singer;

@Repository
public class CommonDaoImpl implements CommonDao{
private String namespace_common="common.";
private String namespace_singer="singer.";
	@Autowired
	private SqlSessionTemplate session;
	/**
	 * 코드 테이블에서 특정 코드 카테고리의 코드정보들을 조회하는 메소드.
	 * @param conn
	 * @param codeCategory 조회할 코드 카테고리.
	 * @return
	 * @throws SQLException
	 */
	
	@Override
	public List<String> selectByCodeCateory(String typeList) {
		// TODO Auto-generated method stub
		List<String> list = session.selectList(namespace_common+"selectByCodeCateory", typeList);
		return list;
	}
	
	@Override
	public List<String> searchSinger(String keyword) {
		// TODO Auto-generated method stub
		return session.selectList(namespace_singer+"searchSinger", keyword);
	}

	@Override
	public int StringToIntSingerId(String singer_name) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace_singer+"StringToIntSingerId", singer_name);
	}

	@Override
	public String selectGroupNameById(String m_id) {
		// TODO Auto-generated method stub
		String str = session.selectOne(namespace_common+"selectGroupNameById", m_id);
		if(str.equals("일반")){
			return "";
		}else{
			return str;
		}
		 
	}

	@Override
	public List<Singer> selectAllSinger() {
		return session.selectList(namespace_common+"selectAllSinger");
	}

	@Override
	public List<Singer> searchSingerAllData(String keyword) {
		// TODO Auto-generated method stub
		return session.selectList(namespace_singer+"searchSingerAllData", keyword);
	}
	
	@Override
	public List<Singer> selectSingerByGroup(int group) {
		return session.selectList(namespace_common + "selectSingerByGroup", group);
	}
	
	@Override
	public List<Group> searchGroup(String keyword) {
		// TODO Auto-generated method stub
		return session.selectList(namespace_common+"searchGroup", keyword);
	}

	@Override
	public int insertSearchData(SearchData searchData) {
		// TODO Auto-generated method stub
		return session.insert(namespace_common+"insertSearchData", searchData);
	}

	@Override
	public int selectSearchData(SearchData searchData) {
		// TODO Auto-generated method stub
		if(session.selectOne(namespace_common+"selectSearchData", searchData)==null){
			return 0;
		}else{
			return 1;
		}
	}

	@Override
	public int updateSearchData(SearchData searchData) {
		// TODO Auto-generated method stub
		return session.update(namespace_common+"updateSearchCount", searchData);
	}

	@Override
	public List<SearchData> selectSearchDataDesc(SearchData search_data) {
		// TODO Auto-generated method stub
		return session.selectList(namespace_common+"selectSearchDataDesc", search_data);
	}

	@Override
	public List<Singer> selectSingerByFavorite() {
		// TODO Auto-generated method stub
		return session.selectList(namespace_singer+"selectSingerByFavorite");
	}

}
