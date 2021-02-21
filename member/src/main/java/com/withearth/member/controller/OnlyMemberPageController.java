package com.withearth.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/useronly/testfile")
public class OnlyMemberPageController {

	@RequestMapping(method=RequestMethod.GET)
	public String onlymember() {
		return "useronly/testfile";
	}
}
