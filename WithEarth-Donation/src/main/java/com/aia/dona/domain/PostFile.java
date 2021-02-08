package com.aia.dona.domain;

public class PostFile {
	
	private int fileIdx;
	private String fileName;
	private int donaIdx;
	

	
	public int getFileIdx() {
		return fileIdx;
	}
	public void setFileIdx(int fileIdx) {
		this.fileIdx = fileIdx;
	}

	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getDonaIdx() {
		return donaIdx;
	}
	public void setDonaIdx(int donaIdx) {
		this.donaIdx = donaIdx;
	}
	
	@Override
	public String toString() {
		return "PostFile [fileIdx=" + fileIdx + ", fileName=" + fileName + ", donaIdx=" + donaIdx + "]";
	}

	

}
