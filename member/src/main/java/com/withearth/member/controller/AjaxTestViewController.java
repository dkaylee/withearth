package com.withearth.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withearth.member.domain.MemberLoginInfo;

@Controller
@RequestMapping("/member/ajaxTest")
public class AjaxTestViewController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String loginInfoajaxTestpage() {
		return "member/loginInfoajax";
	}
	
}

