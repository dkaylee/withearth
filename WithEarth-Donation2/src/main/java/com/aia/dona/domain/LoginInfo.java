package com.aia.dona.domain;

public class LoginInfo {
	
	String id;
	String name;
	String photo;
	
	public LoginInfo(String id, String name, String photo) {
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	@Override
	public String toString() {
		return "LoginInfo [id=" + id + ", name=" + name + ", photo=" + photo + "]";
	}
	
	
	
	
	


}
