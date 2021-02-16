package com.withearth.community.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.withearth.community.domain.MatzipVo;
import com.withearth.community.service.DetailViewService;

@Controller
public class MatzipDetailController {

	@Autowired
	DetailViewService detailView;
	
	@RequestMapping(value="/matzip/matDetailView", method=RequestMethod.POST)
	public String getMatDetail(
			MatzipVo matVo,
			@RequestParam("matIdx") int matIdx,
			HttpServletRequest request,
			Model model
			) {
		
		System.out.println(matVo);
		model.addAttribute("matdetail", detailView.getMatzip(matIdx));
		
		return "/matzip/matDetailView";
	}
	
	
}
