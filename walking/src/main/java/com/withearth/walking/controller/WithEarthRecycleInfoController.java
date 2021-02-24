package com.withearth.walking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WithEarthRecycleInfoController {
	
	@RequestMapping("/Info/recycleInfo")
	public String getRecycleInfo() {
		return"/Info/recycleInfo";
	}
}
