package com.aia.dona.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.dona.dao.HeartDao;
import com.aia.dona.domain.Heart;

@Service
public class HeartShowService {
	
    private HeartDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public HashMap<String, Object> showHeartCount(int idx, int donaIdx) {
		
		dao = template.getMapper(HeartDao.class);
		
		  Heart h = new Heart();
		  h.setIdx(idx);
		  h.setDonaIdx(donaIdx);
		   
	      // 회원의 좋아요 횟수 반환
		 int result = dao.selectUserHeartCnt(h);	
		 // 전체 좋아요 횟수 반환
		 int allCntResult = dao.selectAllHeartCnt(donaIdx);
			
		 HashMap<String, Object> heartMap = new HashMap<String, Object>();
		 heartMap.put("userCnt", result);
		 heartMap.put("allHeartCnt", allCntResult);
		
		return heartMap;
	};
	
	
	public int showHeartCntbyDonaIdx(int donaIdx) {
		
		dao = template.getMapper(HeartDao.class);
		
		return dao.selectAllHeartCnt(donaIdx);
	}
	
}
