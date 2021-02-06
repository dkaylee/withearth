package com.withearth.tumbler.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withearth.tumbler.domain.TumInfo;
import com.withearth.tumbler.service.TumPointService;

@Controller
public class TumPointController {

	@Autowired
	private TumPointService tumpointService;


	// 포인트 적립
//	@RequestMapping("/tumblr/tumlist")
//	public String savingpoint(Model model,
//			                  HttpServletRequest request,
//			                  int id) {
//		model.addAttribute("cafelistView", cafelistService.getListView());
//		return "/tumblr/tumlist";
//	}

	// 포인트 적립 내역 
	@RequestMapping(method = RequestMethod.POST)
	public String getTumPointList(HttpServletRequest request,
			                      Model model) {
		
		List<TumInfo> tumList = tumpointService.selectTumlist();
		model.addAttribute("tumList", tumList);
		
		return "/tumblr/tumlist";
	}

}
