package com.withearth.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

public class KakaoLoginController {
	//ajax로 보낸 카카오 데이터 가져오기
	@RequestMapping(value="/KakaoLogin", method=RequestMethod.POST)
	@ResponseBody
	public String kakaodata(HttpServletRequest request) {
		
	}
}
