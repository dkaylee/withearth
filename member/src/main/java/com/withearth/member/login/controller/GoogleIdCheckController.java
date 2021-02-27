package com.withearth.member.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.member.service.GoogleIdCheckService;
import com.withearth.member.service.KakaoIdCheckService;

@RestController
public class GoogleIdCheckController {

	@Autowired
	private GoogleIdCheckService idcheckService;
	
	@GetMapping("/member/googleidcheck")
	public String idcheck(
			@RequestParam("id") String id
			) {
		return idcheckService.checkId(id);
	}
	
	
	
	
}
