package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.withearth.community.service.DetailViewService;

@Controller
//@RequestMapping(value="/matzip/getDetailView")
public class MatzipDetailController {

	@Autowired
	DetailViewService detailService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getMatDetail(
			@RequestParam("matIdx") int matIdx,
			Model model
			) {
		
		model.addAttribute("matzip", detailService.getMatzip(matIdx));
		
		System.out.println("matzip>>" + detailService.getMatzip(matIdx));
		
		return "/matzip/matDetailView";
	}
	
	
}
