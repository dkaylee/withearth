package com.withearth.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.domain.MatAddRequest;



@Controller
public class MatViewController {
	
	@RequestMapping(value = "/matzip/matlist")
	public String getMatList() {
		
		return "/matzip/matlist";
	}
	
	@RequestMapping(value="/matzip/addmatForm", method = RequestMethod.GET)
	public String getAddForm(
			MatAddRequest matRequest,
			MultipartHttpServletRequest mprq) {
		
		return "/matzip/addmatForm";
	}
	
	@RequestMapping(value="/matzip/matDetailView", method = RequestMethod.GET)
	public String getMatDetail(
			@RequestParam("matIdx") int matIdx,
			Model model
			) {
		
		return "/matzip/matDetailView";
	}
	
	
	
	
	
	

}
