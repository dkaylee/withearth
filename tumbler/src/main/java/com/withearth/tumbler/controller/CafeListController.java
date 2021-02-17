package com.withearth.tumbler.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.withearth.tumbler.service.CafeListSerivce;

@Controller
public class CafeListController {

	@Autowired
	private CafeListSerivce cafelistSerivce;
	
//	@RequestMapping("tumbler/tumlist1")
//	public String cafeList(Model model) {
//		
//		
//		model.addAttribute("list",cafelistSerivce.cafeView());
//		
//		return"tumbler/tumlist1";
//	}
	                        
}
