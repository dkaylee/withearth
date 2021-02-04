package com.aia.point.domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Coupon {
	
	private int couponIdx;  // 쿠폰idx
	private String couponQr;  // 쿠폰	QR
	private String couponHistory;  // 쿠폰사용내역
	private Timestamp historyDate;  // 쿠폰 사용, 소멸날
	private int minusPoint;  // 차감 포인트
	private int idx;  // 회원idx

	public int getCouponIdx() {
		return couponIdx;
	}
	public void setCouponIdx(int couponIdx) {
		this.couponIdx = couponIdx;
	}
	public String getCouponQr() {
		return couponQr;
	}
	public void setCouponQr(String couponQr) {
		this.couponQr = couponQr;
	}
	public String getCouponHistory() {
		return couponHistory;
	}
	public void setCouponHistory(String couponHistory) {
		this.couponHistory = couponHistory;
	}
	public String getHistoryDate() {
		SimpleDateFormat date = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");
		return date.format(historyDate);
	}
	public void setHistoryDate(Timestamp historyDate) {
		this.historyDate = historyDate;
	}
	public int getMinusPoint() {
		return minusPoint;
	}
	public void setMinusPoint(int minusPoint) {
		this.minusPoint = minusPoint;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	@Override
	public String toString() {
		return "Coupon [couponIdx=" + couponIdx + ", couponQr=" + couponQr + ", couponHistory=" + couponHistory
				+ ", historyDate=" + historyDate + ", minusPoint=" + minusPoint + ", idx=" + idx + "]";
	}


	
	
	

}
