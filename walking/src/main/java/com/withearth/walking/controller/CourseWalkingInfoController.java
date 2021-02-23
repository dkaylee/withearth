package com.withearth.walking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CourseWalkingInfoController {
	
	@RequestMapping("/loc/walkingInfo")
	public String getWalkingInfo() {
		return "/loc/walkingInfo";
	}
	
	

}
