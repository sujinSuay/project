package com.schedule.dao;

import java.util.List;

import com.common.vo.Singer;
import com.schedule.vo.Schedule;

public interface ScheduleDao {

	public List<Singer> selectSingerByGroup(int group);
	public int insertSchedule(Schedule schedule);
	public List<Schedule> selectAllSchedule();
}
