package com.withearth.community.domain;

import java.sql.Timestamp;
import java.util.List;


public class MatzipVo {
	
	private int matIdx;
	private String matTitle;
	private String matAddr;
	private String matTime;
	private String matNum;
	private String matCont;
	private String matImg;
	private Timestamp matDate;
	private int matHeart;
	private int idx;
	
	private List<FileVo> fileList;
	
	public int getMatIdx() {
		return matIdx;
	}
	public void setMatIdx(int matIdx) {
		this.matIdx = matIdx;
	}
	public String getMatTitle() {
		return matTitle;
	}
	public void setMatTitle(String matTitle) {
		this.matTitle = matTitle;
	}
	public String getMatAddr() {
		return matAddr;
	}
	public void setMatAddr(String matAddr) {
		this.matAddr = matAddr;
	}
	public String getMatTime() {
		return matTime;
	}
	public void setMatTime(String matTime) {
		this.matTime = matTime;
	}
	public String getMatNum() {
		return matNum;
	}
	public void setMatNum(String matNum) {
		this.matNum = matNum;
	}
	public String getMatCont() {
		return matCont;
	}
	public void setMatCont(String matCont) {
		this.matCont = matCont;
	}
	
	public String getMatImg() {
		return matImg;
	}
	public void setMatImg(String matImg) {
		this.matImg = matImg;
	}
	public Timestamp getMatDate() {
		return matDate;
	}
	public void setMatDate(Timestamp matDate) {
		this.matDate = matDate;
	}
	public int getMatHeart() {
		return matHeart;
	}
	public void setMatHeart(int matHeart) {
		this.matHeart = matHeart;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public List<FileVo> getFileList() {
		return fileList;
	}
	public void setFileList(List<FileVo> fileList) {
		this.fileList = fileList;
	}
	
	@Override
	public String toString() {
		return "MatzipVo [matIdx=" + matIdx + ", matTitle=" + matTitle + ", matAddr=" + matAddr + ", matTime=" + matTime
				+ ", matNum=" + matNum + ", matCont=" + matCont + ", matImg=" + matImg + ", matDate=" + matDate
				+ ", matHeart=" + matHeart + ", idx=" + idx + ", fileList=" + fileList + "]";
	}
	
	
	
	
	
}
