package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.domain.MatAddRequest;
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
	public String addFormView(
			MultipartFile[] uploadFile,
			@ModelAttribute("matData") MatAddRequest matRequest,
			MultipartHttpServletRequest request,
			Model model
			) {
		
		System.out.println(matRequest);
		int result = addMatService.addMatzip(matRequest, request);
		
		model.addAttribute("result", result);
	
		
		return "comm/addView";
	}
	
}
