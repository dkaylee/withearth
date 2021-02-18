package com.withearth.walking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.withearth.walking.domain.SearchParam;
import com.withearth.walking.service.CourseListService;

@Controller
public class CourseListController {
	
	@Autowired
	private CourseListService listService;
	
	@RequestMapping("/loc/courselist") // /courselist
	public String courseList(
			SearchParam param,
			Model model) {
		
		System.out.println(param);
		
		model.addAttribute("listView", listService.getListView(param));
		//model.addAttribute("courseCnt", listService.getCourseTotalCount());
		
		return "/loc/courselist";
	}
	
	
}
