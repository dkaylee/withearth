package com.withearth.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OnlyMemberPageController {
	
	//@Autowired
	//private RedisService redisService;

	@GetMapping(value="/member/useronly/testfile")
	public String onlymember(@CookieValue("JSESSIONID") String sessionId) {
		//System.out.println(redisService.getUserInformation(sessionId));
		return "/useronly/testfile";
	}
}
