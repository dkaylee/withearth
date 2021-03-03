package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.domain.FileVo;
import com.withearth.community.domain.MatAddRequest;

import com.withearth.community.service.AddMatzipService;

@Controller
@RequestMapping(value="/matzip/addmatForm")
public class AddMatzipController {

	@Autowired
	private AddMatzipService addMatService;
	
	// 게시물 등록
	@RequestMapping(method = RequestMethod.GET)
	public String getAddForm() {
			
		return "/matzip/addmatForm";
	}
	
//	@RequestMapping(method = RequestMethod.POST)
//	public int addMat(
//			MatAddRequest matRequest,
//			MultipartHttpServletRequest mprq,
//			Model model
//			) {
//		
//		int result = addMatService.addMatzip(matRequest, mprq);
//		
//		System.out.println(":::::Request:::::"+ matRequest);
//		model.addAttribute("result", result);
//		
//		return result;
//	}
	
	@RequestMapping(method = RequestMethod.POST)
	public int addMat(
			MatAddRequest matRequest,
			MultipartHttpServletRequest mprq,
			Model model
			) {
		
		int result = addMatService.addMatzip(matRequest, mprq);
		
		System.out.println(":::::Request:::::"+ matRequest);
		model.addAttribute("result", result);
		
		return result;
	}
	
}