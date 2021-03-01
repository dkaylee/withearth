package com.aia.dona.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.dona.dao.MessageDao;
import com.aia.dona.domain.Message;

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
