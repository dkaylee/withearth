package com.aia.dona.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.aia.dona.domain.Message;
import com.google.gson.Gson;

public class ChatHandler2 extends TextWebSocketHandler {

	private static final Logger logger = LoggerFactory.getLogger(ChatHandler2.class);

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<Integer, WebSocketSession> sessionMap = new HashMap<Integer, WebSocketSession>();
	
	// 게시물별 참여자 
	private Map<Integer, Set<Integer>> boardList = new HashMap<Integer, Set<Integer>>();
	

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		int chatMember = (int) session.getAttributes().get("user");

		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>" + chatMember);

		sessionList.add(session);
		sessionMap.put(chatMember, session);

		logger.info("{} 연결되었습니다.", session.getId()+":"+chatMember);

		System.out.println("채팅 참여자 : " + chatMember);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		int chatMember = (int) session.getAttributes().get("user");
		logger.info("{}로 부터 {}를 전달 받았습니다.", chatMember, message.getPayload());
		Gson gson = new Gson();
		Message msg = gson.fromJson(message.getPayload(), Message.class);
		
		
		// 전달 메시지
				TextMessage sendMsg = new TextMessage(gson.toJson(msg));
				
				for (WebSocketSession webSocketSession : sessionList) {
					// 상대방에게 메시지 전달
					webSocketSession.sendMessage(sendMsg);
				}
				// 자신에게 메시지 전달
				session.sendMessage(sendMsg);
				
		
//		if( boardList.get(msg.getDonaIdx())==null) {
//			Set<Integer> chatMembers = new HashSet<Integer>();
//			chatMembers.add(chatMember);
//			boardList.put(msg.getDonaIdx(), chatMembers);
//		} else {
//			boardList.get(msg.getDonaIdx()).add(chatMember);
//		}
//		
//		System.out.println(msg);
//		
//		if(boardList.get(msg.getDonaIdx()) != null) {
//			
//			Set<Integer> sendMsgMemberList = boardList.get(msg.getDonaIdx());
//			System.out.println("boardList :" + boardList.get(msg.getDonaIdx()));
//			System.out.println(sendMsgMemberList);  
//			
//			// 전달 메시지
//			TextMessage sendMsg = new TextMessage(gson.toJson(msg));
//			//System.out.println("sendMsg : "+sendMsg);
//			
//
//			Iterator<Integer> itr = sendMsgMemberList.iterator();
//			
//			while (itr.hasNext()) {
//				int memberSession =  itr.next();
//				System.out.println("memberSession :"+memberSession);
//													
//				if(memberSession==msg.getOwnerIdx()) {  
//					
//					WebSocketSession ws = sessionMap.get(memberSession);
//					System.out.println("ownerIdx :"+msg.getOwnerIdx());								
//					// 상대방에게 메시지 전달
//					ws.sendMessage(sendMsg);
//					System.out.println("ws : "+ws);									
//				} 
//		}	
//			// 자신에게 메시지 전달				
//			session.sendMessage(sendMsg);
//			System.out.println("session : "+session);
//		
//		}
	
			
		
		

//		for (WebSocketSession webSocketSession : sessionList) {
//			webSocketSession.sendMessage(new TextMessage(chatMember + "|" + message.getPayload()));
//		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		int chatMember = (int) session.getAttributes().get("user");
		
		sessionList.remove(session);

		logger.info("{} 연결이 끊김", session.getId()+chatMember);

		System.out.println("체팅 퇴장 : " + chatMember);
		// System.out.println("체팅 퇴장 : " + session.getPrincipal().getName());
	}

}
