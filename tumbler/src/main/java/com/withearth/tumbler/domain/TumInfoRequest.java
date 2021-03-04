package com.withearth.tumbler.domain;

import java.sql.Timestamp;



public class TumInfoRequest {
	
	private int uidx; //회원 인덱스
	private int tumidx; //텀블러 인덱스
	private int cafeidx; //카페인덱스
	
	
	
	
	
	public int getUidx() {
		return uidx;
	}





	public void setUidx(int uidx) {
		this.uidx = uidx;
	}





	public int getTumidx() {
		return tumidx;
	}





	public void setTumidx(int tumidx) {
		this.tumidx = tumidx;
	}





	public int getCafeidx() {
		return cafeidx;
	}





	public void setCafeidx(int cafeidx) {
		this.cafeidx = cafeidx;
	}





		// method 생성
		public Tumbler totumbler() {
			Tumbler tumbler = new Tumbler();
			tumbler.setIdx(uidx);
			tumbler.setTum_idx(tumidx);
			tumbler.setCafe_idx(cafeidx);
			
			
			return tumbler;
		}





		@Override
		public String toString() {
			return "TumInfoRequest [uidx=" + uidx + ", tumidx=" + tumidx + ", cafeidx=" + cafeidx + "]";
		}

	
	

}
