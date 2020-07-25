package com.kh.snackking.order.model.vo;

import java.sql.Date;

public class StorageProduct implements java.io.Serializable{
	
	private String sCode;
	private String sDate;
	private int quantity;
	private String pCode;
	private String pName;
	private String location;
	private String manuDate;
	private String section;
	private String secCode;
	private String color;
	
	public StorageProduct() {}

	public StorageProduct(String sCode, String sDate, int quantity, String pCode, String pName, String location,
			String manuDate, String section, String secCode, String color) {
		super();
		this.sCode = sCode;
		this.sDate = sDate;
		this.quantity = quantity;
		this.pCode = pCode;
		this.pName = pName;
		this.location = location;
		this.manuDate = manuDate;
		this.section = section;
		this.secCode = secCode;
		this.color = color;
	}

	public String getsCode() {
		return sCode;
	}

	public void setsCode(String sCode) {
		this.sCode = sCode;
	}

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getManuDate() {
		return manuDate;
	}

	public void setManuDate(String manuDate) {
		this.manuDate = manuDate;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getSecCode() {
		return secCode;
	}

	public void setSecCode(String secCode) {
		this.secCode = secCode;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return "StorageProduct [sCode=" + sCode + ", sDate=" + sDate + ", quantity=" + quantity + ", pCode=" + pCode
				+ ", pName=" + pName + ", location=" + location + ", manuDate=" + manuDate + ", section=" + section
				+ ", secCode=" + secCode + ", color=" + color + "]";
	}

	
}
