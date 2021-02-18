package com.withearth.member.domain;

public class TemporaryPw {

	private String id;
	private String tpw;
	
	public TemporaryPw() {
		getrandomint();
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTpw() {
		return tpw;
	}
	public void setTpw(String tpw) {
		this.tpw = tpw;
	}

	
	private void getrandomint() {
		String randompw = "";
		for(int i=0; i<8; i++) {
			randompw+= (int)(Math.random()*10);
		}
		this.tpw = new String(randompw);
		
	}

	@Override
	public String toString() {
		return "TemporaryPw [id=" + id + ", tpw=" + tpw + "]";
	}
	
	
	
}
