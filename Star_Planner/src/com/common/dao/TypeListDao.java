package com.common.dao;

import java.util.List;

import com.common.vo.TypeList;


public interface TypeListDao{
	public List<TypeList> selectByCodeCateory(String typeList);
}