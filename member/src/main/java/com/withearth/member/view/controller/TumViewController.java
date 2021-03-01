package com.withearth.member.view.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TumViewController {
	

	
	
    //카페 리스트
	@RequestMapping(value="/member/tumbler/tumlist1", method = RequestMethod.GET)
	public String cafeList(Model model,HttpServletRequest request) {

		
		return "tumbler/tumlist1";
	}
	
	 //포인트 내역 출력
	@RequestMapping("/member/tumbler/tumlist")  
	public String tumlist(@RequestParam(value="p",defaultValue="1") int page,
			       Model model, HttpServletRequest request) {
		
	

		 HttpSession session = request.getSession();
		 int idx = (int) session.getAttribute("idx");

		//int idx = 1;
		
		return "tumbler/tumlist";
	}
	
	//포인트 적립
	@RequestMapping("/membertumbler/cafe_idx")
	public String getTumList (Model model, 
			                  HttpServletRequest request, 
			                  @PathVariable("cafe_idx") int cafe_idx
			                  ) {
		
		HttpSession session = request.getSession();
	    int idx = (int) session.getAttribute("idx");
		//int idx = 1; 

		
		return "tumbler/saving";
	}
	
	
	

}
