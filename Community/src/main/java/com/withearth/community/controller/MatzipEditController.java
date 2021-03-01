package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.domain.MatEditRequest;
import com.withearth.community.domain.MatzipVo;
import com.withearth.community.service.EditMatService;

@Controller
public class MatzipEditController {
	
	@Autowired
	private EditMatService editMatService;
	
	@RequestMapping(value="/matzip/editmatForm", method = RequestMethod.GET)
	public MatzipVo matEditForm(
			@RequestParam("matIdx") int matIdx
			) {
		
		return editMatService.getEditMatzip(matIdx);
	}
	
	@RequestMapping(value="/matzip/editmat", method=RequestMethod.POST)
	public int matEdit(
			MatEditRequest editReq,
			MultipartHttpServletRequest mprq		
			) {
		
		return editMatService.editMatzip(editReq, mprq);
	}
	
}
