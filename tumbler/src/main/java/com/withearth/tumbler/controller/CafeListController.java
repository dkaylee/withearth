package com.withearth.tumbler.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.tumbler.domain.Cafe;
import com.withearth.tumbler.service.CafeListSerivce;

@RestController	
@RequestMapping("/tumbler/tumlist1")
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
	
	/*
	@RequestMapping(value="/tumbler/tumlist1", method = RequestMethod.GET)
	public String cafeList(Model model,HttpServletRequest request) {

		List<Cafe> result = cafelistSerivce.cafeView();
		// System.out.println("result!!!" + result); 카페리스트 나옴 

		//model.addAttribute("result", result);
		model.addAttribute("list",cafelistSerivce.cafeView());
		//model.addAttribute("cafelistView",cafelistSerivce.cafelistView());

		return "tumbler/tumlist1";
	}
	
	*/
	
	/*
	 	@GetMapping
	@CrossOrigin
	public List<Cafe> cafeList(HttpSession session, Cafe cafe, ModelMap model){
		
		return cafelistSerivce.cafeView();
	}
	 */
	
	@GetMapping
	@CrossOrigin
	public List<Cafe> cafeList(ModelMap model){
		
		return cafelistSerivce.cafeView();
	}
	
	

}
