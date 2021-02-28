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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.aia.dona.domain.Message;
import com.aia.dona.service.ChatRoomIdCheckService;
import com.aia.dona.service.ChatSaveService;
import com.google.gson.Gson;

public class ChatHandler extends TextWebSocketHandler {
		
	@Autowired
	ChatSaveService saveService;
	@Autowired
	ChatRoomIdCheckService roomChkService;

	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);

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
				
		if( boardList.get(msg.getDonaIdx())==null) {			
			Set<Integer> chatMembers = new HashSet<Integer>();
			// 게시물의 채팅 참여자가 한명 추가 될 때			
			chatMembers.add(chatMember);				
			// 현재 세션이 작성자와 다를 때  --> 알림 전송
			  if(chatMember != msg.getTo()) {
		      // 보낼 상대에게 알림 전송 
		      WebSocketSession target = sessionMap.get(msg.getTo());
					    
			  if(target!=null) {
					    		    
			  TextMessage notice = new TextMessage(gson.toJson(msg)); 
			  target.sendMessage(notice);	    	
			  }	    
		  }
			
			boardList.put(msg.getDonaIdx(), chatMembers);									
		} else {			
			boardList.get(msg.getDonaIdx()).add(chatMember);
		}				
		
					
		System.out.println(msg);
	    System.out.println(boardList);
		
	    // 게시물 채팅 참여자가 있을 경우 --> 채팅 전송
		if(boardList.get(msg.getDonaIdx()) != null) {
			
			Set<Integer> sendMsgMemberList = boardList.get(msg.getDonaIdx());
			System.out.println("boardList - chatMembers" + boardList.get(msg.getDonaIdx()));			
			// 전달 메시지
			TextMessage sendMsg = new TextMessage(gson.toJson(msg));
			//System.out.println("sendMsg : "+sendMsg);
			// 반복하여 채팅참여자에게 메세지 전송						
			Iterator<Integer> itr = sendMsgMemberList.iterator();
						  
			while (itr.hasNext()) {
				int memberSession =  itr.next();
				System.out.println("memberSession :"+memberSession);
							
				WebSocketSession ws = sessionMap.get(memberSession);
				// 상대방에게 메시지 전달
				ws.sendMessage(sendMsg);
				System.out.println("ws : "+ws);										
			   									    				    
		}	
			// 메세지 저장 			
			saveService.saveChat(msg);
			
			// 자신에게 메시지 전달				
			//session.sendMessage(sendMsg);
			//System.out.println("session : "+session);
		
		}
				

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
