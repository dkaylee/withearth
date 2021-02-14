package com.withearth.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.withearth.member.service.MemberVerifyService;

@Controller
public class MemberVerifyController {

	@Autowired
	private MemberVerifyService verifyService;
	
	@RequestMapping("/member/verify")
	public void memberVerify(
			@RequestParam("id") int idx,
			@RequestParam("code") String code,
			Model model
			) {
		model.addAttribute("result", verifyService.memberVerify(idx,code));
	}
	
	
}
