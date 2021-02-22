package com.withearth.walking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/loc/walkingInfo")
public class CourseWalkingInfoController {
	
	public String getWalkingInfo() {
		return "loc/walkingInfo";
	}
	
	@ExceptionHandler(NullPointerException.class)
	public String handleNullPointerException(NullPointerException e) {
		e.printStackTrace();
		return "error/nullPointer";
	}

}
