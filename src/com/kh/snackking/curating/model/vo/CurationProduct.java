package com.kh.snackking.curating.model.vo;

public class CurationProduct implements java.io.Serializable {
	
	private String pName;
	private int pCount;
	private int unitCount;
	private int price;
	
	public CurationProduct() {}

	public CurationProduct(String pName, int pCount, int unitCount, int price) {
		super();
		this.pName = pName;
		this.pCount = pCount;
		this.unitCount = unitCount;
		this.price = price;
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

	@Override
	public String toString() {
		return "CurationProduct [pName=" + pName + ", pCount=" + pCount + ", unitCount=" + unitCount + ", price="
				+ price + "]";
	}
	
}
