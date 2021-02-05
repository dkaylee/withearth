package com.withearth.community.domain;

public class FileVo {
	
	private int fileNum;
	private String orgName;
	private String newName;
	private long fileSize;
	private int matIdx;
	
	
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getNewName() {
		return newName;
	}
	public void setNewName(String newName) {
		this.newName = newName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getMatIdx() {
		return matIdx;
	}
	public void setMatIdx(int matIdx) {
		this.matIdx = matIdx;
	}
	
	
	@Override
	public String toString() {
		return "FileVo [fileNum=" + fileNum + ", orgName=" + orgName + ", newName=" + newName + ", fileSize=" + fileSize
				+ ", matIdx=" + matIdx + "]";
	}
	
	
	

}
