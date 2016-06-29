package com.schedule.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.dao.CommonDao;
import com.common.vo.Group;
import com.common.vo.Singer;
import com.schedule.dao.ScheduleDao;
import com.schedule.vo.Schedule;

@Service("scheduleServie")
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private ScheduleDao dao;
	@Autowired
	private CommonDao cdao;
	
	@Override
	public Map<String, Object> getCategoryList(int group) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("singerList", cdao.selectSingerByGroup(group));
		map.put("eventList", cdao.selectByCodeCateory("event_type"));
		return map;
	}

	@Override
	public int insertSchedule(Schedule schedule) {
		// TODO Auto-generated method stub
		return dao.insertSchedule(schedule);
	}

	@Override
	public List<Schedule> selectAllSchedule() {
		// TODO Auto-generated method stub
		return dao.selectAllSchedule();
	}

	@Override
	public List<String> getCategoryList() {
		// TODO Auto-generated method stub
		return cdao.selectByCodeCateory("search_type");
	}

	@Override
	public List<Schedule> selectScheduleByLocation(String keyword) {
		// TODO Auto-generated method stub
		return dao.selectScheduleByLocation(keyword);
	}
	
	@Override
	public List<Schedule> selectScheduleBySinger(int singer_id) {
		// TODO Auto-generated method stub
		return dao.selectScheduleBySinger(singer_id);
	}

	@Override
	public List<Schedule> selectScheduleByGroup(int group_id) {
		// TODO Auto-generated method stub
		return dao.selectScheduleByGroup(group_id);
	}

	@Override
	public List<Group> searchGroup(String keyword) {
		// TODO Auto-generated method stub
		return cdao.searchGroup(keyword);
	}

	@Override
	public List<Singer> searchSinger(String keyword) {
		// TODO Auto-generated method stub
		return cdao.searchSingerAllData(keyword);
	}

	
}
