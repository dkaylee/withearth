package com.withearth.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/mypage")
public class MemberMypageViewController {

	
	@RequestMapping(method=RequestMethod.GET)
	public String getRegForm() {
		return "member/mypage";
	}
}
