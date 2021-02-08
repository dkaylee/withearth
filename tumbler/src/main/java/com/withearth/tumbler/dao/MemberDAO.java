package com.withearth.tumbler.dao;

import com.withearth.tumbler.domain.Member;

public interface MemberDAO {
//회원가입
	int insertMember(Member member);

//로그인
	//member가 왜 여기 들어가니..?
	Member selectLogin(String id, String pw);
	
}
