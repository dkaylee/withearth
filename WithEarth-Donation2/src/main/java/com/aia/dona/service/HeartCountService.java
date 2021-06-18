package com.aia.dona.service;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.dona.dao.HeartDao;
import com.aia.dona.domain.Heart;


@Service
public class HeartCountService {
	
	private HeartDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public HashMap<String, Object> postHeartCount(int idx, int donaIdx) {
		
		dao = template.getMapper(HeartDao.class);
		
		// 좋아요 누른 적 있는지 확인
		int check = dao.checkDuplication(idx, donaIdx);
		System.out.println("check : "+ check);
		
		Heart h = new Heart();
		h.setIdx(idx);
		h.setDonaIdx(donaIdx);
		
		if(check==0) {
			// 좋아요 처음 누름
			dao.insertHeart(h);
		} else {
			// 좋아요 누른 적 있음	
			dao.deleteHeart(h);
		}
		
		// 회원의 좋아요 횟수 반환
		int result = dao.selectUserHeartCnt(h);	
		// 전체 좋아요 횟수 반환
		int allCntResult = dao.selectAllHeartCnt(donaIdx);
		
		HashMap<String, Object> heartMap = new HashMap<String, Object>();
		heartMap.put("userCnt", result);
		heartMap.put("allHeartCnt", allCntResult);
		
		return heartMap;
		
	}

}
