package com.withearth.tumbler.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withearth.tumbler.service.CafelistService;

@Controller
public class CafeListController {
	
	
	@Autowired
	private CafelistService cafelistService;

	@RequestMapping("/tumblr/cafelist")
	public String getListView(Model model) {
		
		model.addAttribute("cafelistView",cafelistService.getListView());
		return "tumblr/cafelist";
	}
	
}
