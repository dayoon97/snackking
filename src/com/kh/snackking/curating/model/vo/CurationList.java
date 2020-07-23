package com.kh.snackking.curating.model.vo;

import java.sql.Date;

public class CurationList implements java.io.Serializable {
	
	private int cuListNo;
	private int preNo;
	private Date clDate;
	private int price;
	private int amount;
	private String status;
	private int userNo;
	
	public CurationList() {}

	public CurationList(int cuListNo, int preNo, Date clDate, int price, int amount, String status, int userNo) {
		super();
		this.cuListNo = cuListNo;
		this.preNo = preNo;
		this.clDate = clDate;
		this.price = price;
		this.amount = amount;
		this.status = status;
		this.userNo = userNo;
	}

	public int getCuListNo() {
		return cuListNo;
	}

	public void setCuListNo(int cuListNo) {
		this.cuListNo = cuListNo;
	}

	public int getPreNo() {
		return preNo;
	}

	public void setPreNo(int preNo) {
		this.preNo = preNo;
	}

	public Date getClDate() {
		return clDate;
	}

	public void setClDate(Date clDate) {
		this.clDate = clDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "CurationList [cuListNo=" + cuListNo + ", preNo=" + preNo + ", clDate=" + clDate + ", price=" + price
				+ ", amount=" + amount + ", status=" + status + ", userNo=" + userNo + "]";
	}
	
}
