package com.withearth.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withearth.member.service.MemberLoginService;

@Controller
@RequestMapping("/member/login")
public class MemberLoginController {
	
	@Autowired
	private MemberLoginService loginService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String loginForm() {
		return "member/loginform_boot";
	}

	@RequestMapping(method=RequestMethod.POST)
	public String login(
			HttpServletRequest request,
			HttpServletResponse response, //여기서 헷갈리네
			Model model
			) {
		model.addAttribute("loginCheck", loginService.login(request, response));
		return "member/loginview";
	}
	
	
	
	
	
	
	
}
