package com.withearth.member.view.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
public class TumViewController {

    //카페 리스트
	@RequestMapping(value="/tumbler/tumlist1", method = RequestMethod.GET)
	public String cafeList(Model model,HttpServletRequest request) {

		
		return "tumbler/tumlist1";
	}
	
	
	
	 //포인트 내역 출력
	@RequestMapping("/tumbler/tumlist")  
	public String tumlist(@RequestParam(value="p",defaultValue="1") int page,
			              @RequestParam("idx") int idx,
			               HttpServletRequest request) {
		
		 HttpSession session = request.getSession();
		// int idx = (int) session.getAttribute("idx");
		 //session.setAttribute("user", idx);

		//int idx = 1;
		
		return "tumbler/tumlist";
	}

	
	//포인트 적립
	@RequestMapping("/tumbler/point")
	public String getTumList (Model model, 
			                  HttpServletRequest request, 
			                  @RequestParam("idx") int idx,
			                  @RequestParam("cafeidx") int cafeidx
			                  
			                  
			                  ) {
		
		// 로그인 합친후 세션에서 회원idx를 가지고 와야함.
        HttpSession session = request.getSession();
         //int idx = (int) session.getAttribute("idx");
		
		//int idx = 1;
		//int result = tumpointService.registerTumblerPoint(cafe_idx, idx);
        //model.addAttribute("listView", tumlistService.getTumList(idx));
		//System.out.println("적립!!!!" + result);

		return "tumbler/saving";
	}
	
	
	
	
	

}
