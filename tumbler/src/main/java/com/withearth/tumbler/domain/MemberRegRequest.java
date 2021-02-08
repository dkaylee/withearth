package com.withearth.tumbler.domain;

import org.springframework.web.multipart.MultipartFile;

public class MemberRegRequest {

	private String userid;
	private String userpw;
	private String username;
	private MultipartFile userPhoto;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public MultipartFile getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(MultipartFile userPhoto) {
		this.userPhoto = userPhoto;
	}
	
	
	//memberRegRequest에 데이터를 Member로
	public Member toMember() {
		Member member = new Member();
		member.setId(userid);
		member.setPw(userpw);
		member.setName(username);
		
		return member;
	}
	@Override
	public String toString() {
		return "MemberRegRequest [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", userPhoto="
				+ userPhoto + "]";
	}
	
	
	
}
