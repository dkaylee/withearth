package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.community.service.MatzipDeleteService;

@RestController
public class MatzipDeleteController {
	
	@Autowired
	private MatzipDeleteService deleteService;
	
	@RequestMapping(value = "/matzip/deleteMat", method=RequestMethod.POST)
	public int deleteMatzip(
			@RequestParam("matIdx") int matIdx) {
		
		
		return deleteService.deleteMatzip(matIdx);
	}
	
	
}
