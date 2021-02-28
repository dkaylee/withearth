package com.withearth.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.member.domain.MemberLoginInfo;

@RestController
public class AjaxTestController {

	@PostMapping(value="/member/ajaxTest")
	public int memberReg(@RequestBody MemberLoginInfo memberInfo,
			HttpServletRequest request, Model model){
		int result = 1;
		System.out.println(memberInfo);
		
		return result;
	}
	
}

