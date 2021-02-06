package com.withearth.tumbler.dao;

import com.withearth.tumbler.Member;

public interface MemberDAO {

	// 로그인
	Member selectTumLogin(String id, String pw);


	
}