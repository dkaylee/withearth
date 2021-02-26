package com.withearth.member.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.member.service.KakaoIdCheckService;

@RestController
public class KakaoIdCheckController {

	@Autowired
	private KakaoIdCheckService idcheckService;
	
	@GetMapping("/member/kakaoidcheck")
	public String idcheck(
			@RequestParam("id") String id
			) {
		return idcheckService.checkId(id);
	}
	
	
	
	
}
