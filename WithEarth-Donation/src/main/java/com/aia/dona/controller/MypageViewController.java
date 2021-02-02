package com.aia.dona.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageViewController {
	
	@RequestMapping("/user/mypage/view")
	public String goMypageView() {
		
		return "mypage/mypageView";
	}

}
