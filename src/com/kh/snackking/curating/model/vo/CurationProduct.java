package com.kh.snackking.curating.model.vo;

public class CurationProduct implements java.io.Serializable {
	
	private String pCode;
	private String pName;
	private int pCount;
	private int unitCount;
	private int price;
	private String pvendor;
	
	
	public CurationProduct() {}

	public CurationProduct(String pCode, String pName, int pCount, int unitCount, int price, String pvendor) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.pCount = pCount;
		this.unitCount = unitCount;
		this.price = price;
		this.pvendor = pvendor;
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

	public int getpCount() {
		return pCount;
	}

	public void setpCount(int pCount) {
		this.pCount = pCount;
	}

	public int getUnitCount() {
		return unitCount;
	}

	public void setUnitCount(int unitCount) {
		this.unitCount = unitCount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPvendor() {
		return pvendor;
	}

	public void setPvendor(String pvendor) {
		this.pvendor = pvendor;
	}

	@Override
	public String toString() {
		return "CurationProduct [pCode=" + pCode + ", pName=" + pName + ", pCount=" + pCount + ", unitCount="
				+ unitCount + ", price=" + price + ", pvendor=" + pvendor + "]";
	}
	
}
