package com.withearth.member.login.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.member.domain.GoogleInfo;
import com.withearth.member.service.MemberGoogleService;


@RestController
public class GoogleRegController2 {
	
	@Autowired 
	private MemberGoogleService googleService;
	
	// ajax로 보낸 카카오 데이터 가져오기
	
	@PostMapping(value = "/member/googleReg")
	//@ResponseBody
	public int savegoogle(@RequestBody GoogleInfo ginfo,
			HttpServletRequest request, Model model
			) {
		int check=1;
		System.out.println(ginfo);
		int result1 = googleService.memberReg(ginfo,request);
		model.addAttribute("result", result1);
	//	return kakaoService.memberReg(kinfo,request); 이렇게 쓰면 중복된다!
		return check;
	}	 

}
