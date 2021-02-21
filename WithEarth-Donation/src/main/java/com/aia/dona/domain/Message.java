package com.aia.dona.domain;


public class Message {

	private int userIdx;
	private int ownerIdx;
	private int donaIdx;
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

	public int getOwnerIdx() {
		return ownerIdx;
	}

	public void setOwnerIdx(int ownerIdx) {
		this.ownerIdx = ownerIdx;
	}

	public int getDonaIdx() {
		return donaIdx;
	}


	public void setDonaIdx(int donaIdx) {
		this.donaIdx = donaIdx;
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
		return "Message [userIdx=" + userIdx + ", ownerIdx=" + ownerIdx + ", donaIdx=" + donaIdx + ", chatWritetime="
				+ chatWritetime + ", chatMessage=" + chatMessage + "]";
	}







	



}
