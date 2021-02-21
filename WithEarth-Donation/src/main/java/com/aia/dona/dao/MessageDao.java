package com.aia.dona.dao;

import java.util.List;

import com.aia.dona.domain.Message;

public interface MessageDao {

	int insertChatMsg(Message msg);

	List<Message> selectBeforChat(int uid, int oid, int donaIdx);

}
