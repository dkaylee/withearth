package com.aia.dona.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.dona.dao.MessageDao;
import com.aia.dona.domain.Message;

@Service
public class ChatUserCheckService {
	
	MessageDao dao;
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<Message> checkUser(int donaIdx, int roomIdx) {
		System.out.println(donaIdx +":"+ roomIdx);
		dao = template.getMapper(MessageDao.class);
		
		System.out.println(dao.selectBeforChat(donaIdx, roomIdx));
		return dao.selectBeforChat(donaIdx, roomIdx);
			
	}

}
