package com.withearth.member.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.withearth.member.dao.MemberDAO;
import com.withearth.member.domain.KakaoInfo;
import com.withearth.member.domain.Member;

@Service
public class MemberKakaoService {
	
	private MemberDAO dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Transactional
	public int memberReg(KakaoInfo kakaoinfo,HttpServletRequest request) {
		int result = 0;
		
		Member member = kakaoinfo.toMemeberfromkakao();
		//db입력
		dao = template.getMapper(MemberDAO.class);
		//db insert
		result = dao.insertMember(member);
	
		return result;
	}
	
	
}
