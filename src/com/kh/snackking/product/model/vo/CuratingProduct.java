package com.kh.snackking.product.model.vo;

public class CuratingProduct implements java.io.Serializable{
	private int curatingNo; //큐레이팅상품순서번호
	private int cuNo; //큐레이팅 번호
	private String proNo; // 상품 번호
	private String pName; //상품명
	private String pVendor; //상품업체명 (ex 오리온, 매일유업)
	private String ptCode; //상품 종류 코드 PT1, PT2..
	private int price; //상품가격
	private int count; //개수
	
	public CuratingProduct() {}

	public CuratingProduct(int curatingNo, int cuNo, String proNo, String pName, String pVendor, String ptCode,
			int price, int count) {
		super();
		this.curatingNo = curatingNo;
		this.cuNo = cuNo;
		this.proNo = proNo;
		this.pName = pName;
		this.pVendor = pVendor;
		this.ptCode = ptCode;
		this.price = price;
		this.count = count;
	}

	/**
	 * @return the curatingNo
	 */
	public int getCuratingNo() {
		return curatingNo;
	}

	/**
	 * @param curatingNo the curatingNo to set
	 */
	public void setCuratingNo(int curatingNo) {
		this.curatingNo = curatingNo;
	}

	/**
	 * @return the cuNo
	 */
	public int getCuNo() {
		return cuNo;
	}

	/**
	 * @param cuNo the cuNo to set
	 */
	public void setCuNo(int cuNo) {
		this.cuNo = cuNo;
	}

	/**
	 * @return the proNo
	 */
	public String getProNo() {
		return proNo;
	}

	/**
	 * @param proNo the proNo to set
	 */
	public void setProNo(String proNo) {
		this.proNo = proNo;
	}

	/**
	 * @return the pName
	 */
	public String getpName() {
		return pName;
	}

	/**
	 * @param pName the pName to set
	 */
	public void setpName(String pName) {
		this.pName = pName;
	}

	/**
	 * @return the pVendor
	 */
	public String getpVendor() {
		return pVendor;
	}

	/**
	 * @param pVendor the pVendor to set
	 */
	public void setpVendor(String pVendor) {
		this.pVendor = pVendor;
	}

	/**
	 * @return the ptCode
	 */
	public String getPtCode() {
		return ptCode;
	}

	/**
	 * @param ptCode the ptCode to set
	 */
	public void setPtCode(String ptCode) {
		this.ptCode = ptCode;
	}

	/**
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}

	/**
	 * @return the count
	 */
	public int getCount() {
		return count;
	}

	/**
	 * @param count the count to set
	 */
	public void setCount(int count) {
		this.count = count;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "CuratingProduct [curatingNo=" + curatingNo + ", cuNo=" + cuNo + ", proNo=" + proNo + ", pName=" + pName
				+ ", pVendor=" + pVendor + ", ptCode=" + ptCode + ", price=" + price + ", count=" + count + "]";
	}

	
	
}
