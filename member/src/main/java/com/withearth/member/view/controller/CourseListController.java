package com.withearth.member.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CourseListController {

	@GetMapping(value="/member/loc/courselist")
	public String onlymember() {
		return "/loc/courselist";
	}
}
