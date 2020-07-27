package com.kh.snackking.order.model.vo;

public class PickingProduct implements java.io.Serializable {
	
	private int rNum;
	private int pickingProductNo;
	private int pickingNo;
	private String sCode;
	private int pCount;
	private String company;
	private String pName;
	private String location;
	
	public PickingProduct() {}

	public PickingProduct(int rNum, int pickingProductNo, int pickingNo, String sCode, int pCount, String company,
			String pName, String location) {
		super();
		this.rNum = rNum;
		this.pickingProductNo = pickingProductNo;
		this.pickingNo = pickingNo;
		this.sCode = sCode;
		this.pCount = pCount;
		this.company = company;
		this.pName = pName;
		this.location = location;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getPickingProductNo() {
		return pickingProductNo;
	}

	public void setPickingProductNo(int pickingProductNo) {
		this.pickingProductNo = pickingProductNo;
	}

	public int getPickingNo() {
		return pickingNo;
	}

	public void setPickingNo(int pickingNo) {
		this.pickingNo = pickingNo;
	}

	public String getsCode() {
		return sCode;
	}

	public void setsCode(String sCode) {
		this.sCode = sCode;
	}

	public int getpCount() {
		return pCount;
	}

	public void setpCount(int pCount) {
		this.pCount = pCount;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
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

	@Override
	public String toString() {
		return "PickingProduct [rNum=" + rNum + ", pickingProductNo=" + pickingProductNo + ", pickingNo=" + pickingNo
				+ ", sCode=" + sCode + ", pCount=" + pCount + ", company=" + company + ", pName=" + pName
				+ ", location=" + location + "]";
	}
	
}
