package com.withearth.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.member.domain.EditMyInfo;
import com.withearth.member.service.MemberMypageService;

@RestController
@RequestMapping("member/mypage")	
public class MemberMypageRestController {

	@Autowired
	private MemberMypageService mypageService;
	
	@PostMapping
	public int memberReg(@ModelAttribute("editData") EditMyInfo myinfo,
			HttpServletRequest request, Model model){
		return mypageService.editInfo(myinfo,request);
	}

}
