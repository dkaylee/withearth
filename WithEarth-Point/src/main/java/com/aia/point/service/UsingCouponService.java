package com.aia.point.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.point.dao.CouponDao;
import com.aia.point.domain.Coupon;

@Service
public class UsingCouponService {
	
	private CouponDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int useCoupon(int idx, int couponIdx) {
				
		dao = template.getMapper(CouponDao.class);
		// 쿠폰 사용 검증
		

	    int chk = dao.checkUseOrNot(couponIdx);
		
		int result = 0;		
		 System.out.println(chk);
		 
		if(chk==0) {
			result = 0;			
		}else {
			result = dao.transUsedCoupon(idx, couponIdx);
		}
			System.out.println(result);
		return result;
	}

}
