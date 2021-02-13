package com.withearth.member.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.withearth.member.domain.KakaoInfo;
import com.withearth.member.service.MemberKakaoService;

@Controller
public class KakaoLoginController {
	
	
	@Autowired 
	private MemberKakaoService kakaoService;
	
	// ajax로 보낸 카카오 데이터 가져오기
	
	@RequestMapping(value = "/member/kakaoLogin", method = RequestMethod.POST)
	@ResponseBody
	public void savekao(@RequestBody KakaoInfo kinfo) {
		System.out.println(kinfo);
	}	 

}
