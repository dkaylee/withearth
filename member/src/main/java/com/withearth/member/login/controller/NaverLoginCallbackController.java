package com.withearth.member.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NaverLoginCallbackController {

	@GetMapping(value="/member/callback")
	public String onlymember() {
		return "/member/callback";
	}
}
