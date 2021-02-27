package com.withearth.member.domain;

public class NaverInfo {

	private String n_name;
	private String n_img;
	private String n_email;

	// 네이버 회원가입 데이터를 Member로

	public Member toMemeberfromgoogle() {
		Member member = new Member();
		member.setId(n_email);
		member.setName(n_name);
		member.setLogintype("naver");
		member.setPhoto(n_img);
		member.setVerify('Y');

		return member;
	}

	public String getN_name() {
		return n_name;
	}

	public void setN_name(String n_name) {
		this.n_name = n_name;
	}

	public String getN_img() {
		return n_img;
	}

	public void setN_img(String n_img) {
		this.n_img = n_img;
	}

	public String getN_email() {
		return n_email;
	}

	public void setN_email(String n_email) {
		this.n_email = n_email;
	}

	
	@Override
	public String toString() {
		return "NaverInfo [n_name=" + n_name + ", n_img=" + n_img + ", n_email=" + n_email + "]";
	}

}
