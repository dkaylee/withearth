package com.withearth.member.dona.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.member.dona.dao.MessageDao;
import com.withearth.member.dona.domain.Message;

@Service
public class ChatSaveService {
	
	MessageDao dao;
	
	@Autowired
	SqlSessionTemplate template;
	
	public int saveChat(Message msg) {
			
		dao = template.getMapper(MessageDao.class);
		
		return dao.insertChatMsg(msg);		
	}

	
}
