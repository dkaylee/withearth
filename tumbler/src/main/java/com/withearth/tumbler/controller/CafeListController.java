package com.withearth.tumbler.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withearth.tumbler.domain.Cafe;
import com.withearth.tumbler.service.CafeListSerivce;

@Controller
public class CafeListController {
	
	@Autowired
	private CafeListSerivce cafelistSerivce;
	

	@RequestMapping(value="/tumbler/tumlist1", method = RequestMethod.GET)
	public String cafeList(Model model,HttpServletRequest request) {

		List<Cafe> result = cafelistSerivce.cafeView();
		// System.out.println("result!!!" + result); 카페리스트 나옴 

		//model.addAttribute("result", result);
		model.addAttribute("list",cafelistSerivce.cafeView());
		//model.addAttribute("cafelistView",cafelistSerivce.cafelistView());

		return "tumbler/tumlist1";
	}

}
