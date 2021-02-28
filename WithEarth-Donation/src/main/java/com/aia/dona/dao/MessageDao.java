package com.aia.dona.dao;

import java.util.List;

import com.aia.dona.domain.Message;

public interface MessageDao {
    // 메세지를 저장하는 메서드
	int insertChatMsg(Message msg);
    // 저장된 메세지를 불러오는 메서드
	List<Message> selectBeforChat(int donaIdx, int roomIdx);
    // 채팅룸이 이미 존재하는지 확인하는 메서드
	int checkRoomIdx(Message msg);

}
