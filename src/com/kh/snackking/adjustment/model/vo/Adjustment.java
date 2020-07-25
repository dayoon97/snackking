package com.kh.snackking.adjustment.model.vo;

import java.sql.Date;

public class Adjustment implements java.io.Serializable{
	private int adJustmentAmount;
	private String adJustmentComplete;
	private int adJustmentCode;
	private Date adJustmentDate;
	private int tradingCode;
	private int userNo;
	private String company;
	
	public Adjustment() {}

	public Adjustment(int adJustmentAmount, String adJustmentComplete, int adJustmentCode, Date adJustmentDate,
			int tradingCode, int userNo, String company) {
		super();
		this.adJustmentAmount = adJustmentAmount;
		this.adJustmentComplete = adJustmentComplete;
		this.adJustmentCode = adJustmentCode;
		this.adJustmentDate = adJustmentDate;
		this.tradingCode = tradingCode;
		this.userNo = userNo;
		this.company = company;
	}

	
	
	
	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getAdJustmentAmount() {
		return adJustmentAmount;
	}

	public void setAdJustmentAmount(int adJustmentAmount) {
		this.adJustmentAmount = adJustmentAmount;
	}

	public String getAdJustmentComplete() {
		return adJustmentComplete;
	}

	public void setAdJustmentComplete(String adJustmentComplete) {
		this.adJustmentComplete = adJustmentComplete;
	}

	public int getAdJustmentCode() {
		return adJustmentCode;
	}

	public void setAdJustmentCode(int adJustmentCode) {
		this.adJustmentCode = adJustmentCode;
	}

	public Date getAdJustmentDate() {
		return adJustmentDate;
	}

	public void setAdJustmentDate(Date adJustmentDate) {
		this.adJustmentDate = adJustmentDate;
	}

	public int getTradingCode() {
		return tradingCode;
	}

	public void setTradingCode(int tradingCode) {
		this.tradingCode = tradingCode;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Adjustment [adJustmentAmount=" + adJustmentAmount + ", adJustmentComplete=" + adJustmentComplete
				+ ", adJustmentCode=" + adJustmentCode + ", adJustmentDate=" + adJustmentDate + ", tradingCode="
				+ tradingCode + ", userNo=" + userNo + ", company=" + company + "]";
	}

	

	

}
