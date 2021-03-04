package com.withearth.member.domain;

public class MemberLoginInfo {

	private int idx;
	private String id;
	private String name;
	private String photo;
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
		return "MemberLoginInfo [idx=" + idx + ", id=" + id + ", name=" + name + ", photo=" + photo + "]";
	}
	
	
}
