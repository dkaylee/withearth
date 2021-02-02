package com.aia.dona.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aia.dona.domain.Coupon;
import com.aia.dona.service.CouponListService;
import com.aia.dona.service.UsingCouponService;

@RestController
@RequestMapping("/rest/user/coupon")
public class CouponController {
	
	@Autowired
	private UsingCouponService couponService;
	@Autowired
	private CouponListService listService;
	
	@GetMapping("/use/{idx}/{couponIdx}")
	public int usingCoupon(
			@PathVariable("idx") int idx,
			@PathVariable("couponIdx") int couponIdx
			) {
		
		return couponService.useCoupon(idx, couponIdx);
	}
	
	@GetMapping("/list/{idx}")
	public List<Coupon> getCouponList(
			@PathVariable("idx") int idx) {
		
		return listService.getList(idx);
	}

}
