package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.domain.MatEditRequest;
import com.withearth.community.domain.MatzipVo;
import com.withearth.community.service.EditMatService;

@CrossOrigin
@RestController
public class MatzipEditController {
	
	@Autowired
	private EditMatService editMatService;
	
	@GetMapping(value="/matzip/getEdit")
	public MatzipVo matEditForm(
			@RequestParam("matIdx") int matIdx
			) {
		
		return editMatService.getEditMatzip(matIdx);
	}
	
	
	@PostMapping(value="/matzip/setEdit")
	public int matEdit(
			MatEditRequest editReq,
			MultipartHttpServletRequest mprq,
			Model model
			) {
		
		int result = editMatService.editMatzip(editReq, mprq);
		
		System.out.println("Result"+editReq);		
		
		return result;
		
	}
	
	
	
	
	
//	@RequestMapping(value="/matzip/getEdit", method = RequestMethod.GET)
//	public MatzipVo matEditForm(
//			@RequestParam("matIdx") int matIdx
//			) {
//		
//		return editMatService.getEditMatzip(matIdx);
//	}
	
	
	
//	@RequestMapping(value="/matzip/setEdit", method=RequestMethod.POST)
//	public int matEdit(
//			MatEditRequest editReq,
//			MultipartHttpServletRequest mprq,
//			Model model
//			) {
//		
//		int result = editMatService.editMatzip(editReq, mprq);
//		
//		System.out.println("Result"+editReq);		
//		
//		return result;
//	}
	
}
