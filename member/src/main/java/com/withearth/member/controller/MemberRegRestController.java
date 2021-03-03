package com.withearth.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.member.domain.MemberRegRequest;
import com.withearth.member.service.MemberRegService;

@RestController
@RequestMapping("/member/reg")
public class MemberRegRestController {

	@Autowired
	private MemberRegService regService;
	
	@PostMapping
	public int memberReg(@ModelAttribute("regData") MemberRegRequest regRequest,
			HttpServletRequest request, Model model){
		return regService.memberReg(regRequest,request);
	}
	
	
	
	
}
