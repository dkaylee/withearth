package com.withearth.member.login.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.member.domain.KakaoInfo;
import com.withearth.member.service.MemberKakaoService;
//실험용

@RestController
public class KakaoLoginController {
	
	@Autowired 
	private MemberKakaoService kakaoService;
	
	// ajax로 보낸 카카오 데이터 가져오기
	
	@PostMapping(value = "/member/kakaoLogin")
	//@ResponseBody
	public int savekao(@RequestBody KakaoInfo kinfo,
			HttpServletRequest request, Model model
			) {
		int check=1;
		System.out.println(kinfo);
		int result1 = kakaoService.memberReg(kinfo,request);
		model.addAttribute("result", result1);
	//	return kakaoService.memberReg(kinfo,request); 이렇게 쓰면 중복된다!
		return check;
	}	 

}
