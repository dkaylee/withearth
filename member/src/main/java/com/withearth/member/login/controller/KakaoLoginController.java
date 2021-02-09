package com.withearth.member.login.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withearth.member.domain.KakaoInfo;

@Controller
public class KakaoLoginController {
	
	//ajax로 보낸 카카오 데이터 가져오기
	@RequestMapping(value="/member/kakaoLogin", method= {RequestMethod.POST,RequestMethod.GET})
	public String savekao(HttpServletRequest request, KakaoInfo kinfo) {
	    kinfo.setNick(request.getParameter("ka_name"));
	    kinfo.setPimg(request.getParameter("ka_img"));
	    kinfo.setThumimg(request.getParameter("ka_thum"));
	    kinfo.setEmail(request.getParameter("ka_email"));
		return "member/kakaoLogin";
	}

	
}
