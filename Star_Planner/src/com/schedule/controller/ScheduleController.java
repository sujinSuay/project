package com.schedule.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.schedule.service.ScheduleService;

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
	public ModelAndView scheduleRegister(){
		
		
		return new ModelAndView("redirect:/schedule/scheduleRegisterForm.do");
	}
	
	
}
