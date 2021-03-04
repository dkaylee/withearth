package com.withearth.tumbler.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.tumbler.service.TumListService;
import com.withearth.tumbler.service.TumpointService;


@RestController
@RequestMapping("/rest/tumbler")
public class TumpointRestController {
	@Autowired
	private TumpointService tumpointService;
	@Autowired
	private TumListService tumlistService;
	
		
	//포인트 적립
//	/tumbler/qr/"+cafe_idx
	//@GetMapping("/tumbler/{cafe_idx}")
	@GetMapping("/tumbler/point")
	public int getTumList (Model model, 
			                  HttpServletRequest request, 
			                  @RequestParam("idx") int idx,
			                  @RequestParam("cafeidx") int cafeidx
			                  
			                  
			                  ) {
		// 로그인 합친후 세션에서 회원idx를 가지고 와야함.
		// HttpSession session = request.getSession();
	    // int idx = (int) session.getAttribute("idx");
		//int idx = 1; 
		int result = tumpointService.registerTumblerPoint(cafeidx, idx, model);
		//model.addAttribute("listView", tumlistService.getTumList(idx));
		System.out.println("적립이요!!!!"+result);
		
		return tumpointService.registerTumblerPoint(cafeidx,idx,model);
	}
	


}
