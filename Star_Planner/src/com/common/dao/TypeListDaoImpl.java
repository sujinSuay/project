package com.common.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.common.vo.TypeList;

@Repository
public class TypeListDaoImpl implements TypeListDao{
private String namespace="common.";
	
	@Autowired
	private SqlSessionTemplate session;
	/**
	 * 코드 테이블에서 특정 코드 카테고리의 코드정보들을 조회하는 메소드.
	 * @param conn
	 * @param codeCategory 조회할 코드 카테고리.
	 * @return
	 * @throws SQLException
	 */
	public List<TypeList> selectByCodeCateory(String typeList){
		List<TypeList> list = session.selectList(namespace+"selectByCodeCateory", typeList);
		return list;
	}
	
}
