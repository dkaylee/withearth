package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.withearth.community.domain.SearchParam;
import com.withearth.community.service.MatzipListService;

@Controller
public class MatzipListController {
	
	@Autowired
	private MatzipListService matListService;
	
	@RequestMapping(value="/matzip/matlist")
	public String getMatList(
			Model model,
			SearchParam param) {
		
		System.out.println("search param: "+param);
		
		model.addAttribute("list", matListService.getListView());
		model.addAttribute("matlist", matListService.getListView(param));
		
		return "matzip/matlist";
	}
	
}
