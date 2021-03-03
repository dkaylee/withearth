package com.withearth.member.dao;

import com.withearth.member.domain.Member;
import com.withearth.member.domain.TemporaryPw;

public interface MemberDAO {
//회원가입
	int insertMember(Member member);

//로그인
	Member selectLogin(String id);

//아이디 중복체크 & 이메일 보내기
	int selectMemberByIdCount(String id);
//아이디 비밀번호 일치여부
	int selectMemberByIdPwCount(String id,String pw);
// idx, verify 조건으로 조회 
	int selectMemberByIdxVerify(int index);
	
// 인증처리 verify='Y'
	int updateMemberVerify(int idx, String code); 
	
//아이디 비밀번호+인증처리N
	int selectMemberByIdPwVerifyCount(String id,String pw);
	
// 임시비밀번호로 변경
	int updateMembertemporaryPW(TemporaryPw tempw);
	
// 카카오 아이디+type("카카오") 가입 여부 체크
	int kakaoRegCheckCount(String id);

// 카카오 로그인
	Member kakaoSelectLogin(String id);
	
// 구글 아이디+type("구글") 가입 여부 체크
	int googleRegCheckCount(String id);	
	
// 구글 로그인
	Member googleSelectLogin(String id);	
	
// email 유저만 id pw찾기 이용 가능 
	int emailUserCheckCount(String id);		

// 암호화된 비밀번호 로그인 시키기
	Member compareSecretpw(String id);

// 탈퇴한 회원 찾기
	int leaveuserselect(String id);
	
// 네이버 아이디+type("네이버") 가입 여부 체크
	int naverRegCheckCount(String id);	
	
// 네이버 로그인
	Member naverSelectLogin(String id);		
	
// 회원정보 수정 (파일)
	int updatePhoto(Member member);
// 회원정보 수정 (별명)
	int updateName(Member member);
// 회원정보 수정 (비밀번호)
	int updatePw(Member member);	
	
//로그인
	Member selectLoginIdx(int idx);	
	
	
}
