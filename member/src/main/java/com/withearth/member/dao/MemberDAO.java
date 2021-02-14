package com.withearth.member.dao;

import com.withearth.member.domain.Member;

public interface MemberDAO {
//회원가입
	int insertMember(Member member);

//로그인
	//member가 왜 여기 들어가니..?
	Member selectLogin(String id, String pw);

//아이디 중복체크
	int selectMemberByIdCount(String id);

// idx, verify 조건으로 조회 
	int selectMemberByIdxVerify(int index);
	
// 인증처리 verify='Y'
	int updateMemberVerify(int idx, String code); 

}
