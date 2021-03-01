package com.withearth.member.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MypageViewController {
	
	@RequestMapping("/user/mypage/view")
	public String goMypageView() {
		
		return "mypage/mypageView";
	}
	
	@RequestMapping("/coupon/qr/use")
	public String goUsedCouponPage(
			@RequestParam("idx") int idx,
			@RequestParam("cIdx") int cIdx) {		
		
		return "mypage/point/usedCouponView";		
	}

	@RequestMapping("/user/point/view")
	public String goPointView() {
		
		return "mypage/point/pointView";
	}
}
