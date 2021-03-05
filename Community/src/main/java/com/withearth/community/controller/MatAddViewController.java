package com.withearth.community.controller;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.community.dao.MatDao;
import com.withearth.community.domain.MatzipVo;

@CrossOrigin
@RestController
public class MatAddViewController {
	
	private MatDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	@GetMapping("/matzip/addView")
	public MatzipVo getAddView( @RequestParam("matIdx") int matIdx) {
		
		dao = template.getMapper(MatDao.class);
		
		return dao.selectMatByIdx(matIdx);
	}
	
	

}
