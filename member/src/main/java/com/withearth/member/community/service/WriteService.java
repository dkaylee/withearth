package com.withearth.member.community.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.member.dao.MemberDAO;
import com.withearth.member.domain.WriteDTO;

@Service
public class WriteService {

	private MemberDAO dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int write(WriteDTO dto) {
		dao = template.getMapper(MemberDAO.class);
		dao.insertWrite(dto);
		return 1;
	}
	
}
