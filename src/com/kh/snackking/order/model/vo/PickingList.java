package com.kh.snackking.order.model.vo;

public class PickingList implements java.io.Serializable{

	private int pickNo;
	private int cuListNo;
	private String pickDate;
	private String company;
	
	public PickingList() {}

	public PickingList(int pickNo, int cuListNo, String pickDate, String company) {
		super();
		this.pickNo = pickNo;
		this.cuListNo = cuListNo;
		this.pickDate = pickDate;
		this.company = company;
	}

	public int getPickNo() {
		return pickNo;
	}

	public void setPickNo(int pickNo) {
		this.pickNo = pickNo;
	}

	public int getCuListNo() {
		return cuListNo;
	}

	public void setCuListNo(int cuListNo) {
		this.cuListNo = cuListNo;
	}

	public String getPickDate() {
		return pickDate;
	}

	public void setPickDate(String pickDate) {
		this.pickDate = pickDate;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "PickingList [pickNo=" + pickNo + ", cuListNo=" + cuListNo + ", pickDate=" + pickDate + ", company="
				+ company + "]";
	}
	
}
