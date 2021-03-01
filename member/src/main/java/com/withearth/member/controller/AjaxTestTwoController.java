package com.withearth.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.member.domain.Member;
import com.withearth.member.service.AjaxTestTwoService;

@RestController
public class AjaxTestTwoController {
	
	@Autowired
	private AjaxTestTwoService ajaxtestService;
	
	@PostMapping(value="/member/ajaxTest/test?idx=")
	public Member memberReg(@RequestParam("idx") int idx){
		return ajaxtestService.ajaxTest(idx);
	}
	
}

