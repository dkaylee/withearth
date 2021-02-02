package com.withearth.community.domain;

import java.sql.Timestamp;

public class MatzipVo {
	
	private int mat_idx;
	private String mat_title;
	private String mat_addr;
	private String mat_time;
	private String mat_num;
	private String mat_wr;
	private String mat_cont;
	private String mat_img;
	private Timestamp mat_date;
	private int mat_heart;
	private int idx;
	
	
	public int getMat_idx() {
		return mat_idx;
	}
	public void setMat_idx(int mat_idx) {
		this.mat_idx = mat_idx;
	}
	public String getMat_title() {
		return mat_title;
	}
	public void setMat_title(String mat_title) {
		this.mat_title = mat_title;
	}
	public String getMat_addr() {
		return mat_addr;
	}
	public void setMat_add(String mat_addr) {
		this.mat_addr = mat_addr;
	}
	public String getMat_time() {
		return mat_time;
	}
	public void setMat_time(String mat_time) {
		this.mat_time = mat_time;
	}
	public String getMat_num() {
		return mat_num;
	}
	public void setMat_num(String mat_num) {
		this.mat_num = mat_num;
	}
	public String getMat_wr() {
		return mat_wr;
	}
	public void setMat_wr(String mat_wr) {
		this.mat_wr = mat_wr;
	}
	public String getMat_cont() {
		return mat_cont;
	}
	public void setMat_cont(String mat_cont) {
		this.mat_cont = mat_cont;
	}
	public String getMat_img() {
		return mat_img;
	}
	public void setMat_img(String mat_img) {
		this.mat_img = mat_img;
	}
	public Timestamp getMat_date() {
		return mat_date;
	}
	public void setMat_date(Timestamp mat_date) {
		this.mat_date = mat_date;
	}
	public int getMat_heart() {
		return mat_heart;
	}
	public void setMat_heart(int mat_heart) {
		this.mat_heart = mat_heart;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	
	@Override
	public String toString() {
		return "MatzipVo [mat_idx=" + mat_idx + ", mat_title=" + mat_title + ", mat_addr=" + mat_addr + ", mat_time="
				+ mat_time + ", mat_num=" + mat_num + ", mat_wr=" + mat_wr + ", mat_cont=" + mat_cont + ", mat_img="
				+ mat_img + ", mat_date=" + mat_date + ", mat_heart=" + mat_heart + ", idx=" + idx + "]";
	}
	
	
	
	
}
