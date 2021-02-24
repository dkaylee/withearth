package com.aia.point.dao;

import java.util.List;

import com.aia.point.domain.Coupon;

public interface CouponDao {
    // 쿠폰을 생성하는 메서드
	int insertCoupon(Coupon coupon);
    // 쿠폰 사용 후 삭제하는 메서드
	int deleteCoupon(int idx, int couponIdx);
    // 쿠폰 내역을 반환하는 메서드
	List<Coupon> selectCouponList(int idx);
    // 다음에 저장될 쿠폰 idx값을 가져오는 메서드
	int getNextCouponIdx();
	// 사용한 쿠폰의 유효값을 N으로 처리하는 메서드
	int transUsedCoupon(int idx, int couponIdx);
	// 쿠폰을 사용했는지 유효값을 불러오는 메서드
	int checkUseOrNot(int couponIdx);

}
