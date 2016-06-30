package com.schedule.dao;

import java.util.List;

import com.schedule.vo.Schedule;

public interface ScheduleDao {

	public int insertSchedule(Schedule schedule);
	public List<Schedule> selectAllSchedule();
	public List<Schedule> selectScheduleByLocation(String keyword);
	public List<Schedule> selectScheduleBySinger(int singer_id);
	public List<Schedule> selectScheduleByGroup(int group_id);
	public int deleteScheduleById(int schedule_id);
}
