package com.withearth.member.view.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class TumViewController {
	
	@Autowired
	//private TumListService tumlistService;
	
//	 @RequestMapping("/tumbler/{cafe_idx}") 
//		public String makeqr(HttpServletRequest request, 
//				HttpSession session,
//				Model model,
//				  @PathVariable("cafe_idx") int cafeIdx
//				)throws IOException {
//			 
//
//	      return "tumbler/saving"; 
//	      
//		 }
	

	
	
    //카페 리스트
	@RequestMapping(value="/tumbler/tumlist1", method = RequestMethod.GET)
	public String cafeList(Model model,HttpServletRequest request) {

		
		return "tumbler/tumlist1";
	}
	
	 //포인트 내역 출력
	@RequestMapping("/tumbler/tumlist")  
	public String tumlist(@RequestParam(value="p",defaultValue="1") int page,
			       Model model, HttpServletRequest request) {
		
	

		// HttpSession session = request.getSession();
		 //int idx = (int) session.getAttribute("idx");

		int idx = 1;
		
		return "tumbler/tumlist";
	}
	
	//포인트 적립
	@RequestMapping("/cafe_idx")
	public String getTumList(Model model, HttpServletRequest request, @PathVariable("cafe_idx") int cafe_idx) {
   
		
		// 로그인 합친후 세션에서 회원idx를 가지고 와야함.
        // HttpSession session = request.getSession();
        // int idx = (int) session.getAttribute("idx");
		
		int idx = 1;
		//int result = tumpointService.registerTumblerPoint(cafe_idx, idx);
        //model.addAttribute("listView", tumlistService.getTumList(idx));
		//System.out.println("적립!!!!" + result);

		return "tumbler/saving";
	}

	
	
	
	
	

}
