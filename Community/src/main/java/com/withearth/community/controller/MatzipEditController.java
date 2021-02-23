package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.domain.MatEditRequest;
import com.withearth.community.service.EditMatService;

@Controller
public class MatzipEditController {
	
	@Autowired
	private EditMatService editMatService;
	
	@RequestMapping(value="/matzip/editmat", method = RequestMethod.GET)
	public String matEditForm(
			@RequestParam("matIdx") int matIdx,
			Model model
			) {
		
		model.addAttribute("editmat", editMatService.getEditMatzip(matIdx));
		System.out.println("editmat:::::"+ editMatService.getEditMatzip(matIdx));
		
		return "matzip/editmatFrom";
	}
	
	@RequestMapping(value="/matzip/editmat", method=RequestMethod.POST)
	public String matEdit(
			MatEditRequest editReq,
			MultipartHttpServletRequest mprq,
			Model model			
			) {
		
		model.addAttribute("result", editMatService.editMatzip(editReq, mprq));
		
		return "matzip/editmat";
	}
	
}
