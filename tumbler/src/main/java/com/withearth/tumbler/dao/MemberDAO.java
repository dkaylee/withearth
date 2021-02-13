package com.withearth.tumbler.dao;

import com.withearth.tumbler.domain.Member;

public interface MemberDAO {
//회원가입
	int insertMember(Member member);

//로그인
	Member selectLogin(String id, String pw);
	
}
