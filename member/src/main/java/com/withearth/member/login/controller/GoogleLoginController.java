package com.withearth.member.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.member.service.GoogleLoginService;
import com.withearth.member.service.KakaoLoginService;

@RestController
public class GoogleLoginController {

	//@Autowired
	//GoogleLoginService googleLoginService;
	
	//카카오 로그인 세션정보 저장
	@PostMapping(value = "/member/googleLogin")
	public String login(
			HttpServletRequest request,
			HttpServletResponse response, //여기서 헷갈리네
			Model model
			) {
		//model.addAttribute("loginCheck", googleLoginService.login(request, response));
		//System.out.println(googleLoginService.login(request, response));
		System.out.println(request.getParameter("id"));
		return "member/loginview";
	}
	
	
	
	
	
	
	
}
