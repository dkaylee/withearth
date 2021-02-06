package com.withearth.tumbler.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.tumbler.dao.TumblerDao;
import com.withearth.tumbler.domain.TumInfo;

@Service
public class TumPointService {
	
	private TumblerDao dao;
	
	
	@Autowired
	private SqlSessionTemplate template;


	public List<TumInfo> selectTumlist() {
		// TODO Auto-generated method stub
		return null;
	}


	
	
	//텀블러 로그인폼에서 로그인하면 포인트 적립
	
	
	//텀블러 인증 리스트



}
