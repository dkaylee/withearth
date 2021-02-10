package com.withearth.community.domain;

public class FileVo {
	
	private int fileId;
	private String orgFName;
	private String newFName;
	private long fileSize;
	private int matIdx;
	
	
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
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
		return "FileVo [fileId=" + fileId + ", orgFName=" + orgFName + ", newFName=" + newFName + ", fileSize="
				+ fileSize + ", matIdx=" + matIdx + "]";
	}
	
	
	
	
	

}
