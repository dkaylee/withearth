package com.withearth.community.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.dao.MatDao;
import com.withearth.community.domain.MatzipVo;
import com.withearth.community.domain.StarRateRequest;

@Service
public class StarReviewService {
	
	private MatDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Transactional
	public int addStarRate(
			HttpServletRequest request,
			StarRateRequest starRequest) {
		
		int result = 0 ;
		
		String matIdx = request.getParameter("matIdx");
		String idx = request.getParameter("idx");
		String star = request.getParameter("star");
		String sCont = request.getParameter("sCont");
		
	
		
		
		//String[] review = request.getParameterValues("formData");
		
		//starRequest = new StarRateRequest();
		
		//starRequest.setIdx(idx); 
		
		
			
		dao = template.getMapper(MatDao.class);
		result = dao.insertReview(starRequest);
		
		return result;
	}
	
	
	public List<StarRateRequest> getStarRate(int matIdx) {
		
		List<StarRateRequest> list = null;
		
		try {
		dao = template.getMapper(MatDao.class);
		
		list = dao.selectReview(matIdx);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

	



}
