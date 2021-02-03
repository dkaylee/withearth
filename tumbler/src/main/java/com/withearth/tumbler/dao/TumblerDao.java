package com.withearth.tumbler.dao;

import com.withearth.tumbler.domain.Tumbler;

public interface TumblerDao {

	//로그인
	Tumbler selectTumLogin(String id, String pw);
	


}
