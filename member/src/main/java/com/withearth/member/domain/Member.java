package com.withearth.member.domain;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Random;

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
	
	public Member() {
		getRandomString();
	}
	
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
	
	//회원 인증을 위한 난수 발생
	private void getRandomString() {
		
		Random r = new Random(System.nanoTime());
		//난수 문자열
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<10; i++) {
			if(r.nextBoolean()) {
				//숫자 발생 -> sb에 추가
				sb.append(r.nextInt(10));
			} else {
				//문자 발생 -> sb추가
				sb.append((char)(r.nextInt(26)+97));
			}
		}
		System.out.println("난수 생성:" + sb);
		this.code = new String(sb);
	}
	
	@Override
	public String toString() {
		return "Member [idx=" + idx + ", id=" + id + ", pw=" + pw + ", name=" + name + ", photo=" + photo
				+ ", regdate=" + regdate + ", logintype=" + logintype + ", verify=" + verify + ", code=" + code + "]";
	}
	
	//date값 얻기?
	public Date getTodate() {
		return new Date(this.regdate.getTime());
	}
	
	//로그인 정보
	public LoginInfo toLoginInfo() {
		return new LoginInfo(id,name,photo);
	}
	
	
	
}
