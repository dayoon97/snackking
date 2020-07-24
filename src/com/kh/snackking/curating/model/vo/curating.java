package com.kh.snackking.curating.model.vo;

public class curating {
	private int preNo; //선호도 번호
	private int cuNo; //큐레이팅 번호
	private int proCount; //총 개수
	private int cuPrice; //총 가격
	private String userYN; //유저 확인 여부
	
	public curating() {}

	public curating(int preNo, int cuNo, int proCount, int cuPrice, String userYN) {
		super();
		this.preNo = preNo;
		this.cuNo = cuNo;
		this.proCount = proCount;
		this.cuPrice = cuPrice;
		this.userYN = userYN;
	}

	/**
	 * @return the preNo
	 */
	public int getPreNo() {
		return preNo;
	}

	/**
	 * @param preNo the preNo to set
	 */
	public void setPreNo(int preNo) {
		this.preNo = preNo;
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
	 * @return the proCount
	 */
	public int getProCount() {
		return proCount;
	}

	/**
	 * @param proCount the proCount to set
	 */
	public void setProCount(int proCount) {
		this.proCount = proCount;
	}

	/**
	 * @return the cuPrice
	 */
	public int getCuPrice() {
		return cuPrice;
	}

	/**
	 * @param cuPrice the cuPrice to set
	 */
	public void setCuPrice(int cuPrice) {
		this.cuPrice = cuPrice;
	}

	/**
	 * @return the userYN
	 */
	public String getUserYN() {
		return userYN;
	}

	/**
	 * @param userYN the userYN to set
	 */
	public void setUserYN(String userYN) {
		this.userYN = userYN;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "curating [preNo=" + preNo + ", cuNo=" + cuNo + ", proCount=" + proCount + ", cuPrice=" + cuPrice
				+ ", userYN=" + userYN + "]";
	}
	
	
}
