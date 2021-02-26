package com.withearth.member.domain;

public class GoogleInfo {

	private String g_name;
	private String g_img;
	private String g_email;
	

	
	//카카오 회원가입 데이터를 Member로
	
	public Member toMemeberfromgoogle() {
		Member member = new Member();
		member.setId(g_email);
		member.setName(g_name);
		member.setLogintype("google");
		member.setPhoto(g_img);
		member.setVerify('Y');
		
		return member;
	}



	public String getG_name() {
		return g_name;
	}



	public void setG_name(String g_name) {
		this.g_name = g_name;
	}



	public String getG_img() {
		return g_img;
	}



	public void setG_img(String g_img) {
		this.g_img = g_img;
	}



	public String getG_email() {
		return g_email;
	}



	public void setG_email(String g_email) {
		this.g_email = g_email;
	}



	@Override
	public String toString() {
		return "googleInfo [g_name=" + g_name + ", g_img=" + g_img + ", g_email=" + g_email + "]";
	}
	
	
	
	
}
