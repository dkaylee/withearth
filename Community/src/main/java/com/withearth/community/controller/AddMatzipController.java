package com.withearth.community.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.domain.FileVo;
import com.withearth.community.domain.MatAddRequest;
import com.withearth.community.service.AddFileService;
import com.withearth.community.service.AddMatzipService;

@Controller
public class AddMatzipController {

	@Autowired
	private AddMatzipService addMatService;
	
	@Autowired
	private AddFileService addFileService;
	
	@RequestMapping(value="/matzip/addmatForm", method = RequestMethod.GET)
	public String getAddForm() {
		
		return "/matzip/addmatForm";
	}
	
	@RequestMapping(value="/matzip/addmatForm", method = RequestMethod.POST)
	public String addFormView(
			FileVo file,
			MatAddRequest matRequest,
			HttpServletRequest request,
			MultipartHttpServletRequest mprq,
			Model model
			) {
		
		System.out.println(matRequest);
		System.out.println(file);
		
		int result = addMatService.addMatzip(matRequest, request);
		
		model.addAttribute("fileList", file);
		model.addAttribute("matReq", matRequest);
		model.addAttribute("result", result);
	
		
		return "/matzip/addmatView";
	}
	
}