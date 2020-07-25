package com.kh.snackking.curating.model.vo;

public class CurationList implements java.io.Serializable {
	
	private int cuListNo;
	private int preNo;
	private String clDate;
	private int price;
	private int amount;
	private String status;
	private int userNo;
	private String userName;
	private String company;
	
	public CurationList() {}

	public CurationList(int cuListNo, int preNo, String clDate, int price, int amount, String status, int userNo,
			String userName, String company) {
		super();
		this.cuListNo = cuListNo;
		this.preNo = preNo;
		this.clDate = clDate;
		this.price = price;
		this.amount = amount;
		this.status = status;
		this.userNo = userNo;
		this.userName = userName;
		this.company = company;
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

	public String getClDate() {
		return clDate;
	}

	public void setClDate(String clDate) {
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "CurationList [cuListNo=" + cuListNo + ", preNo=" + preNo + ", clDate=" + clDate + ", price=" + price
				+ ", amount=" + amount + ", status=" + status + ", userNo=" + userNo + ", userName=" + userName
				+ ", company=" + company + "]";
	}
		
}
