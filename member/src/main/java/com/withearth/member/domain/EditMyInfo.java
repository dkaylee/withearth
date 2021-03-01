package com.withearth.member.domain;

import org.springframework.web.multipart.MultipartFile;

public class EditMyInfo {

	private int idx;
	private String id;
	private String cgname;
	private String cgpw;
	private MultipartFile cgphoto;
	private String oldphoto;
	
	
	
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
	public String getCgname() {
		return cgname;
	}
	public void setCgname(String cgname) {
		this.cgname = cgname;
	}
	public String getCgpw() {
		return cgpw;
	}
	public void setCgpw(String cgpw) {
		this.cgpw = cgpw;
	}
	public MultipartFile getCgphoto() {
		return cgphoto;
	}
	public void setCgphoto(MultipartFile cgphoto) {
		this.cgphoto = cgphoto;
	}
	
	public String getOldphoto() {
		return oldphoto;
	}
	public void setOldphoto(String oldphoto) {
		this.oldphoto = oldphoto;
	}
	
	public Member toMember() {
		Member member = new Member();
		member.setIdx(idx);
		member.setId(id);
		member.setName(cgname);
		member.setPw(cgpw);
		
		return member;
	}
	@Override
	public String toString() {
		return "EditMyInfo [idx=" + idx + ", id=" + id + ", cgname=" + cgname + ", cgpw=" + cgpw + ", cgphoto="
				+ cgphoto + ", oldphoto=" + oldphoto + "]";
	}
	
	


	
	
	
	
	
}
