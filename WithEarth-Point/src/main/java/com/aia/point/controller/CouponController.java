package com.aia.point.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.aia.point.domain.Coupon;
import com.aia.point.service.CouponListService;
import com.aia.point.service.UsingCouponService;

@RestController
@RequestMapping("/rest/user/coupon")
@CrossOrigin(origins = "*")
public class CouponController {
	
	@Autowired
	private UsingCouponService couponService;
	@Autowired
	private CouponListService listService;
	
	@GetMapping("/use")
	public int usingCoupon(
			@RequestParam("idx") int idx,
			@RequestParam("cIdx") int cIdx
			) {
		
		return couponService.useCoupon(idx, cIdx);
	}
	
	@GetMapping("/list/{idx}")
	@CrossOrigin
	public List<Coupon> getCouponList(
			@PathVariable("idx") int idx) {
		
		return listService.getList(idx);
	}

}
