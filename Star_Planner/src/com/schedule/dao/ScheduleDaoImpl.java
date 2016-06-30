package com.schedule.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.schedule.vo.Schedule;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {
	private String namespace_schedule = "schedule.";
	
	@Autowired
	private SqlSessionTemplate session;

	

	@Override
	public int insertSchedule(Schedule schedule) {
		// TODO Auto-generated method stub
		return session.insert(namespace_schedule+"insert", schedule);
	}

	@Override
	public List<Schedule> selectAllSchedule() {
		// TODO Auto-generated method stub
		return session.selectList(namespace_schedule+"selectAllSchedule");
	}

	@Override
	public List<Schedule> selectScheduleByLocation(String keyword) {
		// TODO Auto-generated method stub
		return session.selectList(namespace_schedule+"selectScheduleByLocation", keyword);
	}

	@Override
	public List<Schedule> selectScheduleBySinger(int singer_id) {
		// TODO Auto-generated method stub
		return session.selectList(namespace_schedule+"selectScheduleBySinger", singer_id);
	}

	@Override
	public List<Schedule> selectScheduleByGroup(int group_id) {
		// TODO Auto-generated method stub
		return session.selectList(namespace_schedule+"selectScheduleByGroup", group_id);
	}

	@Override
	public int deleteScheduleById(int schedule_id) {
		// TODO Auto-generated method stub
		return session.delete(namespace_schedule+"deleteScheduleById", schedule_id);
	}
	
	
	
	

	
}
