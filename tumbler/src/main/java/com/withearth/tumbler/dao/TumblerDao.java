package com.withearth.tumbler.dao;

import java.util.List;

import com.withearth.tumbler.domain.TumInfo;
import com.withearth.tumbler.domain.Tumbler;

public interface TumblerDao {



	//로그인
	Tumbler selectTumLogin(String id, String pw);

	
	//적립 포인트
	int updateTumPoint(int idx);
	


}
