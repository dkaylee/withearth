
package com.withearth.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.withearth.member.domain.TemporaryPw;
import com.withearth.member.service.FindPwService;

@Controller
@RequestMapping("/member/findpw")
public class MemberFindPwController {
	
	@Autowired
	FindPwService findpwservice;

	@RequestMapping(method=RequestMethod.GET)
	public String findPw() {
		return "member/findpwform";
	}

	@RequestMapping(method=RequestMethod.POST)
	public String findpwv(@RequestParam("id") String id,@ModelAttribute TemporaryPw tempw) {
		System.out.println(tempw);
		findpwservice.changepw(tempw);
		return "member/findpwview";
	}
	
}