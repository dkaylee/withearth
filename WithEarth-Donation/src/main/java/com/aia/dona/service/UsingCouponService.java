package com.aia.dona.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.dona.dao.CouponDao;

@Service
public class UsingCouponService {
	
	private CouponDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int useCoupon(int idx, int couponIdx) {
				
		dao = template.getMapper(CouponDao.class);
				
		return dao.deleteCoupon(idx, couponIdx);
	}

}
