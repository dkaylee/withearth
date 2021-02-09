package com.withearth.walking.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withearth.walking.domain.CourseSettingRequest;
import com.withearth.walking.service.CourseSettingService;

@Controller
public class CourseSettingController {

	@Autowired
	private CourseSettingService courseService;
	
	// 코스 설정 페이지
	@RequestMapping(value="/course/setting", method = RequestMethod.GET)
	public String getcourseSet() {
		
		return "test210208";
		
	}
	
	// 코스 설정 후 완료 안내 페이지
	@RequestMapping(method = RequestMethod.POST)
	public String courseSet(
			@ModelAttribute("courseData") CourseSettingRequest setRequest,
			HttpServletRequest request,
			Model model
			) {
		
		System.out.println(setRequest);
		
		int result = courseService.courseSet(setRequest, request);
		
		model.addAttribute("result", result);
		
		
		return "course_setting_view";
	}
	
}
