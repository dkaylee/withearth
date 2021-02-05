package com.withearth.community.domain;


import org.springframework.web.multipart.MultipartFile;

public class MatAddRequest {
	
	private int mIdx;
	private String mWr;
	private String mTitle;
	private String mAddr;
	private String mTime;
	private String mNum;
	private String mCont;
	private MultipartFile mImg;
	
	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}
	public String getmWr() {
		return mWr;
	}
	public void setmWr(String mWr) {
		this.mWr = mWr;
	}
	public String getmTitle() {
		return mTitle;
	}
	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}
	public String getmAddr() {
		return mAddr;
	}
	public void setmAddr(String mAddr) {
		this.mAddr = mAddr;
	}
	public String getmTime() {
		return mTime;
	}
	public void setmTime(String mTime) {
		this.mTime = mTime;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	public String getmCont() {
		return mCont;
	}
	public void setmCont(String mCont) {
		this.mCont = mCont;
	}
	public MultipartFile getmImg() {
		return mImg;
	}
	public void setmImg(MultipartFile mImg) {
		this.mImg = mImg;
	}
	
	public MatzipVo toMatzip() {
		
		MatzipVo matzip = new MatzipVo();
		
		matzip.setMatTitle(mTitle);
		matzip.setMatAddr(mAddr);
		matzip.setMatTime(mTime);
		matzip.setMatNum(mNum);
		matzip.setMatCont(mCont);
		
		return matzip;
	}
	
	@Override
	public String toString() {
		return "MatAddRequest [mIdx=" + mIdx + ", mWr=" + mWr + ", mTitle=" + mTitle + ", mAddr=" + mAddr + ", mTime="
				+ mTime + ", mNum=" + mNum + ", mCont=" + mCont + ", mImg=" + mImg + "]";
	}
	
	
	
	
	
}
