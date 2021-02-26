package com.withearth.member.domain;

import java.io.Serializable;

public class LoginInfo implements Serializable{ //serializable을 implements해야돼 

	private String id;
	private String name;
	private String photo;
	
	public LoginInfo(String id, String name, String photo) {
		this.id = id;
		this.name= name;
		this.photo=photo;
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
		return "LoginInfo [id=" + id + ", name=" + name + ", photo=" + photo + "]";
	}
	
	
	
	
	
}
