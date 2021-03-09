package com.withearth.community.domain;

public class FileVo {
	
	private int fileIdx;
	private String orgFName;
	private String newFName;
	private long fileSize;
	private int matIdx;
	
//	public FileVo(String orgFName, String newFName, long fileSize, int matIdx) {
//		this.orgFName = orgFName;
//		this.newFName = newFName;
//		this.fileSize = fileSize;
//		this.matIdx=matIdx;
//	}
	
	public int getFileIdx() {
		return fileIdx;
	}
	public void setFileId(int fileIdx) {
		this.fileIdx = fileIdx;
	}
	public String getOrgFName() {
		return orgFName;
	}
	public void setOrgFName(String orgFName) {
		this.orgFName = orgFName;
	}
	public String getNewFName() {
		return newFName;
	}
	public void setNewFName(String newFName) {
		this.newFName = newFName;
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
		return "FileVo [fileIdx=" + fileIdx + ", orgFName=" + orgFName + ", newFName=" + newFName + ", fileSize="
				+ fileSize + ", matIdx=" + matIdx + "]";
	}
	
	
	
	
	

}
