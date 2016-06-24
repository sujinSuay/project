package com.schedule.dao;

import java.util.List;

import com.common.vo.Singer;

public interface ScheduleDao {

	public List<Singer> selectSingerByGroup(int group);
	
}
