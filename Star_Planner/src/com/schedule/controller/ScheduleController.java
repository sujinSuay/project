package com.schedule.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.common.vo.Group;
import com.common.vo.Singer;
import com.schedule.service.ScheduleService;
import com.schedule.vo.Schedule;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	private ScheduleService service;
	
	@RequestMapping("/scheduleRegisterForm")
	public ModelAndView scheduleRegisterForm(HttpSession session){
		if(session.getAttribute("groupId")==null){
			return new ModelAndView("redirect:/member_login.do");
		}
		int group = (int)session.getAttribute("groupId");
		Map<String, Object> list = service.getCategoryList(group);
		return new ModelAndView("/schedule_register.do", list);
	}
	
	@RequestMapping("/scheduleRegister")
	public ModelAndView scheduleRegister(Schedule schedule){
		schedule.setSchedule_start(schedule.getSchedule_start().replace(" ", ""));
		schedule.setSchedule_end(schedule.getSchedule_end().replace(" ", ""));
		service.insertSchedule(schedule);
		return new ModelAndView("redirect:/schedule/scheduleRegisterForm.do");
	}
	
	@RequestMapping("/selectAllSchedule")
	@ResponseBody
	public List<Schedule> selectAllSchedule(){
		List<Schedule> list = service.selectAllSchedule();
		return list;
	}
	
	@RequestMapping("/searchSinger")
	@ResponseBody
	public List<Singer> searchSinger(String keyword){
		List<Singer> list = service.searchSinger(keyword); 
		return list;
	}
	
	@RequestMapping("/searchGroup")
	@ResponseBody
	public List<Group> searchGroup(String keyword){
		List<Group> list = service.searchGroup(keyword); 
		return list;
	}
	
	@RequestMapping("/selectScheduleBySinger")
	@ResponseBody
	public List<Schedule> selectScheduleBySinger(int singer_id){
		List<Schedule> list = service.selectScheduleBySinger(singer_id);
		return list;
	}
	
	@RequestMapping("/selectScheduleByGroup")
	@ResponseBody
	public List<Schedule> selectScheduleByGroup(int group_id){
		List<Schedule> list = service.selectScheduleByGroup(group_id);
		return list;
	}
	
	@RequestMapping("/selectScheduleByLocation")
	@ResponseBody
	public List<Schedule> selectScheduleByLocation(String keyword){
		List<Schedule> list = service.selectScheduleByLocation(keyword);
		return list;
	}
	
	@RequestMapping("/scheduleMain")
	public ModelAndView scheduleMain(){
		List<String> list = service.getCategoryList();
		return new ModelAndView("/schedule_main.do", "categoryList", list);
	}
	
	
}
