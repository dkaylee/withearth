package com.withearth.member.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WalkingInfoController {

	@GetMapping(value="/member/loc/walkingInfo")
	public String onlymember() {
		return "/loc/walkingInfo";
	}
}
