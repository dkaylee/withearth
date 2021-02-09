package com.withearth.member.domain;

public class KakaoInfo {

	String nick;
	String pimg;
	String thumimg;
	String email;
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public String getThumimg() {
		return thumimg;
	}
	public void setThumimg(String thumimg) {
		this.thumimg = thumimg;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "KakaoInfo [nick=" + nick + ", pimg=" + pimg + ", thumimg=" + thumimg + ", email=" + email + "]";
	}
	
	
	
	
}
