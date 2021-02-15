package com.withearth.tumbler.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.tumbler.service.TumListService;
import com.withearth.tumbler.service.TumpointService;


@RestController
@RequestMapping("/tumbler/qr")
public class TumpointController {
	@Autowired
	private TumpointService tumpointService;
	@Autowired
	private TumListService tumlistService;
	
		
	//포인트 적립
//	/tumbler/qr/"+cafe_idx
	@GetMapping("{cafe_idx}")
	public String getTumList (Model model, HttpServletRequest request, @PathVariable("cafe_idx") int cafe_idx) {
		// 로그인 합친후 세션에서 회원idx를 가지고 와야함.
		// HttpSession session = request.getSession();
	    // int idx = (int) session.getAttribute("idx");
		int idx = 1; 
		int result = tumpointService.registerTumblerPoint(cafe_idx, idx);
		model.addAttribute("listView", tumlistService.getTumList(idx));
		
		return "tumbler/tumlist";
	}


}
