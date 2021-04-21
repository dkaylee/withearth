package com.withearth.member.domain;

public class WriteDTO {

	private int idx;
	private String username;
	private String subject;
	private String contents;
	private int useridx;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
	public int getUseridx() {
		return useridx;
	}
	public void setUseridx(int useridx) {
		this.useridx = useridx;
	}
	@Override
	public String toString() {
		return "WriteDTO [idx=" + idx + ", username=" + username + ", subject=" + subject + ", contents=" + contents
				+ ", useridx=" + useridx + "]";
	}

	
	
}
