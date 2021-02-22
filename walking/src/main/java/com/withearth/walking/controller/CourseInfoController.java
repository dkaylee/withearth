package com.withearth.walking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/loc/CourseInfo")
public class CourseInfoController {
	
	public String getCourseInfo() {
		return "/loc/walkingInfo";
	}

}
