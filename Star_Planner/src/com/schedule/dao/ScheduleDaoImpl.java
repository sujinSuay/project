package com.schedule.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.common.vo.Singer;
import com.schedule.vo.Schedule;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {
	private String namespace_schedule = "schedule.";
	private String namespace_common = "common.";
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Singer> selectSingerByGroup(int group) {
		return session.selectList(namespace_common + "selectSingerByGroup", group);
	}

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

	
}
