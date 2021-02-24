package com.withearth.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserListPageController {

	@GetMapping(value="/member/loginuser")
	public String onlymember() {
		return "/member/loginuserlist";
	}
}
