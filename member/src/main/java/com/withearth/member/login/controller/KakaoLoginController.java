package com.withearth.member.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String savekao(@RequestBody KakaoInfo kinfo,
			HttpServletRequest request, Model model
			) {
		System.out.println(kinfo);
		int result = kakaoService.memberReg(kinfo,request);
		model.addAttribute("result", result);
		return "kakaoview";
	}	 

}
