package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.domain.MatAddRequest;

import com.withearth.community.service.AddMatzipService;

@Controller
public class AddMatzipController {

	@Autowired
	private AddMatzipService addMatService;
	
	@RequestMapping(value="/matzip/addmatForm", method = RequestMethod.GET)
	public String getAddForm() {
		
		return "/matzip/addmatForm";
	}
	
	@RequestMapping(value="/matzip/addmatForm", method = RequestMethod.POST)
	public String addFormView(
			MatAddRequest matRequest,
			MultipartHttpServletRequest mprq,
			Model model
			) {
		
		System.out.println(matRequest);
		
		
		int result = addMatService.addMatzip(matRequest, mprq);
		
		System.out.println(result);
		
		model.addAttribute("matReq", matRequest);
		model.addAttribute("result", result);
	
		
		return "/matzip/addmatView";
	}
	
}