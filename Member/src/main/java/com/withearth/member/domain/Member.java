package com.withearth.member.domain;

import java.sql.Timestamp;

public class Member {

	private int idx;
	private String id;
	private String pw;
	private String name;
	private String photo;
	private Timestamp regdate;
	private String logintype;
	private char verify;
	private String code;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
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
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getLogintype() {
		return logintype;
	}
	public void setLogintype(String logintype) {
		this.logintype = logintype;
	}
	public char getVerify() {
		return verify;
	}
	public void setVerify(char verify) {
		this.verify = verify;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", id=" + id + ", pw=" + pw + ", name=" + name + ", photo=" + photo
				+ ", regdate=" + regdate + ", logintype=" + logintype + ", verify=" + verify + ", code=" + code + "]";
	}
	
	
	
	
}
