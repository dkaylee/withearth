package com.withearth.tumbler.controller;

import javax.servlet.http.HttpServletRequest;

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
	

	//이용 가능한 카페 리스트
	@RequestMapping("/")
	public String getListView(HttpServletRequest request,Model model) {
		
		System.out.println(request);
		String result = cafelistService.getListView( request);
		
		model.addAttribute(result);
		return "/tumblr/tumlist";
	}
	
	
	
	
	
}
