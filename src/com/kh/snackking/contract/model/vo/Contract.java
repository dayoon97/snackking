package com.kh.snackking.contract.model.vo;

import java.sql.Date;

public class Contract implements java.io.Serializable {
	
	private String conCode;    //계약코드
	private Date startDate;    //계약시작일
	private Date endDate;      //계약종료일
	private Date conDate;      //계약일
	private int delivCount;    //월배송횟수
	private int amountPDeliv;  //회차당 금액
	private String denYN;      //계약종료여부YN. 체크 제약조건
	private int userNo;        //회원번호. foriegn key
	private String corpName;   //거래처명 
	private int ttlAmount;     //월 계약금액
	private int conNo;         //계약번호. 시퀀스 nextval로 숫자 순차적으로 나열. primary key

	public Contract() {}

	public Contract(String conCode, Date startDate, Date endDate, Date conDate, int delivCount, int amountPDeliv,
			String denYN, int userNo, String corpName, int ttlAmount, int conNo) {
		super();
		this.conCode = conCode;
		this.startDate = startDate;
		this.endDate = endDate;
		this.conDate = conDate;
		this.delivCount = delivCount;
		this.amountPDeliv = amountPDeliv;
		this.denYN = denYN;
		this.userNo = userNo;
		this.corpName = corpName;
		this.ttlAmount = ttlAmount;
		this.conNo = conNo;
	}

	public String getConCode() {
		return conCode;
	}

	public Date getStartDate() {
		return startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public Date getConDate() {
		return conDate;
	}

	public int getDelivCount() {
		return delivCount;
	}

	public int getAmountPDeliv() {
		return amountPDeliv;
	}

	public String getDenYN() {
		return denYN;
	}

	public int getUserNo() {
		return userNo;
	}

	public String getCorpName() {
		return corpName;
	}

	public int getTtlAmount() {
		return ttlAmount;
	}

	public int getConNo() {
		return conNo;
	}

	public void setConCode(String conCode) {
		this.conCode = conCode;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public void setConDate(Date conDate) {
		this.conDate = conDate;
	}

	public void setDelivCount(int delivCount) {
		this.delivCount = delivCount;
	}

	public void setAmountPDeliv(int amountPDeliv) {
		this.amountPDeliv = amountPDeliv;
	}

	public void setDenYN(String denYN) {
		this.denYN = denYN;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}

	public void setTtlAmount(int ttlAmount) {
		this.ttlAmount = ttlAmount;
	}

	public void setConNo(int conNo) {
		this.conNo = conNo;
	}

	@Override
	public String toString() {
		return "Contract [conCode=" + conCode + ", startDate=" + startDate + ", endDate=" + endDate + ", conDate="
				+ conDate + ", delivCount=" + delivCount + ", amountPDeliv=" + amountPDeliv + ", denYN=" + denYN
				+ ", userNo=" + userNo + ", corpName=" + corpName + ", ttlAmount=" + ttlAmount + ", conNo=" + conNo
				+ "]";
	}
	
	
	
	
	
}


