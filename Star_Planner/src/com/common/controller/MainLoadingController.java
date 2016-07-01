package com.common.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.common.service.MainLoadingServiceImpl;
import com.common.vo.LinkList;

@Controller
@RequestMapping("/main")
public class MainLoadingController {
	
	@Autowired
	MainLoadingServiceImpl mainService;
	
	@RequestMapping("/home")
	@ResponseBody
	public ModelAndView LoadingMain(){
		
		HashMap<String, Object> map = new HashMap<>();
		
		System.out.println("## MainLoadingController + LoadingMain");
		List<LinkList> list = mainService.getMainLink();
		System.out.println(list);
		map.put("list", list);

		return new ModelAndView("/common/main.do", map);
	}

}
