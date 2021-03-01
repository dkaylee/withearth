package com.withearth.member.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WalkingServiceController {

	@GetMapping(value="/member/loc/walkingservice")
	public String onlymember() {
		return "/loc/walkingservice";
	}
}
