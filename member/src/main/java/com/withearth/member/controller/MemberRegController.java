package com.withearth.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.withearth.member.domain.MemberRegRequest;
import com.withearth.member.service.MemberRegService;

@Controller
@RequestMapping("/member/reg")
public class MemberRegController {
	
	//생성자나 세터 등을 사용하여 의존성 주입을 하려고 할 때, 해당 빈을 찾아서 주입해주는 annotation이다.
	
	@Autowired
	private MemberRegService regService;

	@RequestMapping(method=RequestMethod.GET)
	public String getRegForm() {
		return "member/regform_boot";
	}
	
	
	@RequestMapping(method=RequestMethod.POST)	
	public String memberReg(@ModelAttribute("regData") MemberRegRequest regRequest,
			HttpServletRequest request, Model model){
		System.out.println(regRequest);
		int result = regService.memberReg(regRequest,request);
		model.addAttribute("result", result);
		return "member/regview";
	}
	


}	
	/*
	@RequestMapping(method=RequestMethod.POST)	
	public String memberReg(
		//@ModelAttribute는 사용자가 요청시 전달하는 값을 오브젝트 형태로 매핑해주는 어노테이션
		//메소드가 리턴하는 객체를 view로 바로 넘겨 사용 가능
			@ModelAttribute("regData") MemberRegRequest regRequest,
		//클라이언트의 요청 정보 확인
			HttpServletRequest request,
			Model model) {
		System.out.println(regRequest);
		int result = regService.memberReg(regRequest,request);
		model.addAttribute("result", result);
		
		/* return "member/regview"; 
		return "home";} */

