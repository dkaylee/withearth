package com.withearth.member.domain;

public class KakaoInfo {

	private String ka_name;
	private String ka_img;
	private String ka_thum;
	private String ka_email;
	

	
	//카카오 회원가입 데이터를 Member로
	
	public Member toMemeberfromkakao() {
		Member member = new Member();
		member.setId(ka_name);
		member.setName(ka_name);
		member.setLogintype("kakao");
		member.setPhoto(ka_thum);
		member.setVerify('Y');
		
		return member;
	}
	
	
	
	public String getKa_name() {
		return ka_name;
	}



	public String getKa_img() {
		return ka_img;
	}



	public String getKa_thum() {
		return ka_thum;
	}



	public String getKa_email() {
		return ka_email;
	}



	@Override
	public String toString() {
		return "KakaoInfor [ka_name=" + ka_name + ", ka_img=" + ka_img + ", ka_thum=" + ka_thum + ", ka_email="
				+ ka_email + "]";
	}
	
	
}
