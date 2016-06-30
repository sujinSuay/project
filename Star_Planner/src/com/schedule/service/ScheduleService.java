package com.schedule.service;

import java.util.List;
import java.util.Map;

import com.common.vo.Group;
import com.common.vo.Singer;
import com.schedule.vo.Schedule;

public interface ScheduleService {
	public Map<String, Object> getCategoryList(int group);
	public List<String> getCategoryList();
	public int insertSchedule(Schedule schedule);
	public List<Schedule> selectAllSchedule();
	public List<Schedule> selectScheduleByLocation(String keyword);
	public List<Schedule> selectScheduleBySinger(int singer_id);
	public List<Schedule> selectScheduleByGroup(int group_id);
	public List<Singer> searchSinger(String keyword);
	public List<Group> searchGroup(String keyword);
	public int deleteScheduleById(int schedule_id);
}
