package com.schedule.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.BoardDao;
import com.common.dao.TypeListDao;
import com.schedule.dao.ScheduleDao;
import com.schedule.vo.Schedule;

@Service("scheduleServie")
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private ScheduleDao dao;
	@Autowired
	private TypeListDao tdao;
	
	@Override
	public Map<String, Object> getCategoryList(int group) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("singerList", dao.selectSingerByGroup(group));
		map.put("eventList", tdao.selectByCodeCateory("event_type"));
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

}
