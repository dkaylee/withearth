package com.aia.dona.domain;


public class Message {

	private int userIdx;
	private int roomIdx;
	private int donaIdx;
	private int to;
	private String chatWritetime;
	private String chatMessage;

	public Message() {
	}

	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}	

	public int getRoomIdx() {
		return roomIdx;
	}

	public void setRoomIdx(int roomIdx) {
		this.roomIdx = roomIdx;
	}

	public int getDonaIdx() {
		return donaIdx;
	}

	public void setDonaIdx(int donaIdx) {
		this.donaIdx = donaIdx;
	}
		
	public int getTo() {
		return to;
	}

	public void setTo(int to) {
		this.to = to;
	}

	public String getChatWritetime() {
		return chatWritetime;
	}

	public void setChatWritetime(String chatWritetime) {
		this.chatWritetime = chatWritetime;
	}

	public String getChatMessage() {
		return chatMessage;
	}

	public void setChatMessage(String chatMessage) {
		this.chatMessage = chatMessage;
	}

	@Override
	public String toString() {
		return "Message [userIdx=" + userIdx + ", roomIdx=" + roomIdx + ", donaIdx=" + donaIdx + ", to=" + to
				+ ", chatWritetime=" + chatWritetime + ", chatMessage=" + chatMessage + "]";
	}


	




	



}
