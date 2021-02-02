package com.aia.dona.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PointViewController {
	
	@RequestMapping("/user/point/view")
	public String goPointView() {
		
		return "mypage/point/pointView";
	}

}
