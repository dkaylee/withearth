package com.withearth.member.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SunViewController {
	
	//dona/main
	@GetMapping("/member/dona/main")
	public String gotodona() {
		return "dona/post/donaMain";
	}
	
}
