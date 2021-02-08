package com.withearth.walking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withearth.walking.service.CourseSettingService;

@Controller
@RequestMapping("/course/setting")
public class CourseSettingController {

	@Autowired
	private CourseSettingService courseService;
	
	// 코스 설정 페이지
	@RequestMapping(method = RequestMethod.GET)
	public String getcourseSet() {
		
		return "test210208";
		
	}
	
	// 코스 설정 후 완료 안내 페이지
	@RequestMapping(method = RequestMethod.POST)
	public String courseSet() {
		
		return "course_setting_view";
	}
	
}
