package com.common.dao;

import java.util.List;

import com.common.vo.Group;
import com.common.vo.SearchData;
import com.common.vo.Singer;


public interface CommonDao{
	public List<String> selectByCodeCateory(String typeList);
	public List<String> searchSinger(String keyword);
	public List<Singer> searchSingerAllData(String keyword);
	public String selectGroupNameById(String m_id);
	public int StringToIntSingerId(String singer_name);
	public List<Singer> selectAllSinger();
	List<Singer> selectSingerByGroup(int group);
	List<Group> searchGroup(String keyword);
	public int insertSearchData(SearchData searchData);
	public int selectSearchData(SearchData searchData);
	public int updateSearchData(SearchData searchData);
	public List<SearchData> selectSearchDataDesc(SearchData search_data);
	public List<Singer> selectSingerByFavorite();
}
