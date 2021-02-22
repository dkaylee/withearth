package com.withearth.member.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class MemberLoginListController {
	

	@GetMapping("/member/loginuser")
	public String memberlist() {
	return "member/loginuserlist";

	}
}
