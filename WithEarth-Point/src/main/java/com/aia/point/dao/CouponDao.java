package com.aia.point.dao;

import java.util.List;

import com.aia.point.domain.Coupon;

public interface CouponDao {

	int insertCoupon(Coupon coupon);

	int deleteCoupon(int idx, int couponIdx);

	List<Coupon> selectCouponList(int idx);

}
