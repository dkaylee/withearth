package com.withearth.member.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.member.service.NaverLoginService;

@RestController
public class NaverLoginController {
	
	@Autowired
	NaverLoginService naverLoginService;

	@PostMapping(value="/member/naverLogin")
	public String login(
			HttpServletResponse response,
			HttpServletRequest request,
			Model model
			) {
		model.addAttribute("loginCheck", naverLoginService.login(request, response));
		System.out.println(naverLoginService.login(request, response));
		System.out.println(request.getParameter("id"));
		return "member/loginview";
	}
	
}
