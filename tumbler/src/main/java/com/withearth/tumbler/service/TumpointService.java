package com.withearth.tumbler.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.tumbler.dao.TumblerDao;
import com.withearth.tumbler.domain.Point;
import com.withearth.tumbler.domain.Tumbler;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class TumpointService {
	
	private TumblerDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int registerTumblerPoint(int cafeidx, int idx){
		Tumbler tumbler = new Tumbler();
		tumbler.setCafe_idx(cafeidx);
		tumbler.setIdx(idx);
		tumbler.setTum_point(100);
		dao = template.getMapper(TumblerDao.class);
		int result =  dao.insertTumbler(tumbler);
		log.info("result1: " + result+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		Point point = new Point();
		point.setIdx(idx);
		point.setSaving_system("tumbler");
		point.setSaving_point(100);
		point.setTum_idx(tumbler.getTum_idx());
		result =  dao.insertPoint(point);
		log.info("result2: " + result+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		return result;
	}
}
