package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.community.domain.MatzipVo;
import com.withearth.community.service.DetailViewService;

@RestController
public class MatzipDetailController {

	@Autowired
	private DetailViewService detailService;
	
	@RequestMapping(value="/matzip/matDetail", method = RequestMethod.GET)
	public MatzipVo getMatDetail(
			@RequestParam("matIdx") int matIdx,
			Model model
			) {
		
		return detailService.getMatzip(matIdx);
	}
	
	
}
