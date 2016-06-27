package com.schedule.service;

import java.util.List;
import java.util.Map;

import com.schedule.vo.Schedule;

public interface ScheduleService {
	public Map<String, Object> getCategoryList(int group);
	public int insertSchedule(Schedule schedule);
	public List<Schedule> selectAllSchedule();
}
