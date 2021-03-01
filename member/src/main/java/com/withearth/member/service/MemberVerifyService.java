package com.withearth.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.member.dao.MemberDAO;

@Service
public class MemberVerifyService {

	private MemberDAO dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int memberVerify(int idx, String code) {
		dao=template.getMapper(MemberDAO.class);
		
		int result=0; //0->잘못된 요청, 1->인증 완료, 3-> 이미 인증
		int isVerify = dao.selectMemberByIdxVerify(idx);
		//0 or 1
		if(isVerify==1) {
			result = 3;
		} else {
			result = dao.updateMemberVerify(idx,code);
		}
		return result;
		
	}
}
