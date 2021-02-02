package com.aia.dona.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.dona.dao.CouponDao;
import com.aia.dona.domain.Coupon;

@Service
public class CouponListService {
	
	private CouponDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<Coupon> getList(int idx) {
		
		dao = template.getMapper(CouponDao.class);
		
		return dao.selectCouponList(idx);
		
	}

}
