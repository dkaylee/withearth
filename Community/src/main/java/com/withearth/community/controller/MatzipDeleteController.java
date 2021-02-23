package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.withearth.community.service.MatzipDeleteService;

@Controller
public class MatzipDeleteController {
	
	@Autowired
	private MatzipDeleteService deleteService;
	
	@RequestMapping(value = "/matzip/delete")
	public String deleteMatzip(
			@RequestParam("matIdx") int matIdx,
			Model model) {
		
		
		model.addAttribute("result", deleteService.deleteMatzip(matIdx));
		
		return "matzip/deletemat";
	}
	
	
}
