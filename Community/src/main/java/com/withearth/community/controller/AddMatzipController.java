package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withearth.community.service.AddMatzipService;

@Controller
public class AddMatzipController {

	@Autowired
	private AddMatzipService addMatService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getAddForm() {
		
		return "comm/addmatForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String addView(
			@ModelAttribute("MatzipVo") 
			) {
		
		return "comm/addView";
	}
	
}
