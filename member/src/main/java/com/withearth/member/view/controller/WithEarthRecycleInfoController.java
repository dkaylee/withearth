package com.withearth.member.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WithEarthRecycleInfoController {
	
	@RequestMapping("/member/Info/recycleInfo")
	public String getRecycleInfo() {
		return"/Info/recycleInfo";
	}
}
