package com.withearth.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MatViewController {
	
	@RequestMapping(value = "/matzip/matlist")
	public String getMatList() {
		
		return "/matzip/matlist";
	}
	
	

}
