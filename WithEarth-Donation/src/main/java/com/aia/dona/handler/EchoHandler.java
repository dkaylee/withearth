package com.aia.dona.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.aia.dona.domain.Message;
import com.aia.dona.service.ChatSaveService;
import com.google.gson.Gson;

public class EchoHandler extends TextWebSocketHandler {
	
	@Autowired
	ChatSaveService saveService;

	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<String, WebSocketSession> sessionMap = new HashMap<String, WebSocketSession>();

	@Override  // 접속호출
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		int chatMember = (int) session.getAttributes().get("user");

		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>" + chatMember);

		sessionList.add(session);
		//sessionMap.put(chatMember, session);

		logger.info("{} 연결되었습니다.", session.getId()+":"+chatMember);

		System.out.println("체팅 참여자 : " + chatMember);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		int chatMember = (int) session.getAttributes().get("user");
		
		logger.info("{}로 부터 {}를 전달 받았습니다.", chatMember, message.getPayload());
		Gson gson = new Gson();
		Message msg = gson.fromJson(message.getPayload(), Message.class);
		
		System.out.println(msg);
		

		// 전달 메시지
		TextMessage sendMsg = new TextMessage(gson.toJson(msg));
		
		for (WebSocketSession webSocketSession : sessionList) {
			
		    System.out.println("webSocketSession : "+webSocketSession);
		    System.out.println("sessionList : "+sessionList);
			// 상대방에게 메시지 전달
			webSocketSession.sendMessage(sendMsg);				
		}
	
		saveService.saveChat(msg);
		// 자신에게 메시지 전달
		//session.sendMessage(sendMsg); 
		
	}

	@Override   // 접속종료시 호출
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		int chatMember = (int) session.getAttributes().get("user");
		sessionList.remove(session);
		logger.info("{} 연결이 끊김", session.getId()+chatMember);
		System.out.println("체팅 퇴장 : " + chatMember);
	}

}
