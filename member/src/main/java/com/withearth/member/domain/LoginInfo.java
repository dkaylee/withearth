package com.withearth.member.domain;

import java.io.Serializable;

public class LoginInfo implements Serializable{ //serializable을 implements해야돼 

	private int idx;
	private String id;
	private String name;
	private String photo;
	
	public LoginInfo(int idx, String id, String name, String photo) {
		this.idx = idx;
		this.id = id;
		this.name= name;
		this.photo=photo;
	}


	public int getIdx() {
		return idx;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPhoto() {
		return photo;
	}


	@Override
	public String toString() {
		return "LoginInfo [idx=" + idx + ", id=" + id + ", name=" + name + ", photo=" + photo + "]";
	}


	
	
	
	
}
