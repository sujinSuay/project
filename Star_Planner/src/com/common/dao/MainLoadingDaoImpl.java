package com.common.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainLoadingDaoImpl implements MainLoadingDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<String> selectMainLink() {
		
		System.out.println("##MainLoadingDaoImpl + selectMainLink() ");
		return session.selectList("common.selectMainLink");
	}

}
