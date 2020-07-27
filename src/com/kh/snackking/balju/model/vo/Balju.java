package com.kh.snackking.balju.model.vo;

public class Balju implements java.io.Serializable{
	private String balCode; //발주코드
	private String balType; //발주타입
	private int quantity;	//발주 수량
	private String baljuDate;//발주 신청일
	private String expectedDate;//입고예정일
	private int price;		//단가 가격
	private String unit;	//단위
	private String vendor; // 업체명
	private String pCode; 	//상품 코드
	private String pName; 	//상품 이름
	private int userNo; 	//신청자 번호
	private String userName; //신청자 이름
	
	public Balju() {}

	public Balju(String balCode, String balType, int quantity, String baljuDate, String expectedDate, int price,
			String unit, String vendor, String pCode, String pName, int userNo, String userName) {
		super();
		this.balCode = balCode;
		this.balType = balType;
		this.quantity = quantity;
		this.baljuDate = baljuDate;
		this.expectedDate = expectedDate;
		this.price = price;
		this.unit = unit;
		this.vendor = vendor;
		this.pCode = pCode;
		this.pName = pName;
		this.userNo = userNo;
		this.userName = userName;
	}

	/**
	 * @return the balCode
	 */
	public String getBalCode() {
		return balCode;
	}

	/**
	 * @param balCode the balCode to set
	 */
	public void setBalCode(String balCode) {
		this.balCode = balCode;
	}

	/**
	 * @return the balType
	 */
	public String getBalType() {
		return balType;
	}

	/**
	 * @param balType the balType to set
	 */
	public void setBalType(String balType) {
		this.balType = balType;
	}

	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	/**
	 * @return the baljuDate
	 */
	public String getBaljuDate() {
		return baljuDate;
	}

	/**
	 * @param baljuDate the baljuDate to set
	 */
	public void setBaljuDate(String baljuDate) {
		this.baljuDate = baljuDate;
	}

	/**
	 * @return the expectedDate
	 */
	public String getExpectedDate() {
		return expectedDate;
	}

	/**
	 * @param expectedDate the expectedDate to set
	 */
	public void setExpectedDate(String expectedDate) {
		this.expectedDate = expectedDate;
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
	 * @return the unit
	 */
	public String getUnit() {
		return unit;
	}

	/**
	 * @param unit the unit to set
	 */
	public void setUnit(String unit) {
		this.unit = unit;
	}

	/**
	 * @return the vendor
	 */
	public String getVendor() {
		return vendor;
	}

	/**
	 * @param vendor the vendor to set
	 */
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	/**
	 * @return the pCode
	 */
	public String getpCode() {
		return pCode;
	}

	/**
	 * @param pCode the pCode to set
	 */
	public void setpCode(String pCode) {
		this.pCode = pCode;
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
	 * @return the userNo
	 */
	public int getUserNo() {
		return userNo;
	}

	/**
	 * @param userNo the userNo to set
	 */
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Balju [balCode=" + balCode + ", balType=" + balType + ", quantity=" + quantity + ", baljuDate="
				+ baljuDate + ", expectedDate=" + expectedDate + ", price=" + price + ", unit=" + unit + ", vendor="
				+ vendor + ", pCode=" + pCode + ", pName=" + pName + ", userNo=" + userNo + ", userName=" + userName
				+ "]";
	}
	
	
}
