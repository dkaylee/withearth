/*
package com.withearth.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.member.service.MemberFindPwService;

@RestController
public class MemberFindPwController {
	
	@Autowired
	private MemberFindPwService findpwService;

	@GetMapping("/member/findpw")
	public String findPw(@RequestParam("id") String id) {
		return findpwService.CheckId(id);
	}

}
*/