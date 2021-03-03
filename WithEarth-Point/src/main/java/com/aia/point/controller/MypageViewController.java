package com.aia.point.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@CrossOrigin(origins = "*")
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
