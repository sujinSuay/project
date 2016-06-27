package com.schedule.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	/*@RequestMapping("/scheduleMain")
	public ModelAndView scheduleMain(HttpSession session){
		
		System.out.println("schedule main");
		return new ModelAndView("/schedule_main.do");
	}*/
	
	@RequestMapping("/calendar")
	@ResponseBody
	public List<Schedule> scheduleEvents(){
		System.out.println("get schedule events");
		return service.selectAllSchedule();
	}
	/*@RequestMapping("/calendar")
	@ResponseBody
	public Map<String, Object> scheduleEvents(){
		Map<String, Object> map = new HashMap<>();
		map.put("title", "Meeting");
		map.put("start", "2016-05-12T10:30:00");
		map.put("end", "2016-05-12T12:30:00");
		System.out.println(map);
		return map;
	}*/
	
	
}
