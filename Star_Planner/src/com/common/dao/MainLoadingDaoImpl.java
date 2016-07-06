package com.common.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.common.vo.LinkList;

@Repository
public class MainLoadingDaoImpl implements MainLoadingDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<LinkList> selectMainLink() {
		
		return session.selectList("common.selectMainLink");
	}

}
