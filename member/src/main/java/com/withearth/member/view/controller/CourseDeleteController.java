package com.withearth.member.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.withearth.member.walking.service.CourseDeleteService;

@Controller
public class CourseDeleteController {

	@Autowired
	private CourseDeleteService deleteService;
	
	@RequestMapping("/member/loc/coursedelete")
	public String deleteCourse(
			@RequestParam("course_idx") int course_idx,
			@RequestParam("idx") int idx,
			Model model
			) {
		
		// 결과 -> 0또는 1
		model.addAttribute("result", deleteService.deleteCourse(course_idx, idx));
		
		return "/loc/coursedelete";
		
	}
	
}
