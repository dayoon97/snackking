package com.kh.snackking.product.model.vo;

import java.io.Serializable;

public class ProductStorage implements Serializable{
	private String storageCode;//식별자
	private String storageDate;//등록일 (입고 완료 후 등록한 날짜)
	private String color;//유통기한 색상
	private String sectionCode;//분류 코드( 발주코드나, 교환 코드 )
	private String Section;//발주 or 교환
	private String mfd; //제조일
	private String sLocation; //위치 L1,L2
	private int quantity; //수량
	private String pCode; //상품코드
	private String pName; //상품이름 상품 테이블 조인
	private int basicExp; //기본 유통기한 상품 테이블 조인
	
	public ProductStorage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductStorage(String storageCode, String storageDate, String color, String sectionCode, String section,
			String mfd, String sLocation, int quantity, String pCode, String pName, int basicExp) {
		super();
		this.storageCode = storageCode;
		this.storageDate = storageDate;
		this.color = color;
		this.sectionCode = sectionCode;
		Section = section;
		this.mfd = mfd;
		this.sLocation = sLocation;
		this.quantity = quantity;
		this.pCode = pCode;
		this.pName = pName;
		this.basicExp = basicExp;
	}
	public String getStorageCode() {
		return storageCode;
	}
	public void setStorageCode(String storageCode) {
		this.storageCode = storageCode;
	}
	public String getStorageDate() {
		return storageDate;
	}
	public void setStorageDate(String storageDate) {
		this.storageDate = storageDate;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSectionCode() {
		return sectionCode;
	}
	public void setSectionCode(String sectionCode) {
		this.sectionCode = sectionCode;
	}
	public String getSection() {
		return Section;
	}
	public void setSection(String section) {
		Section = section;
	}
	public String getMfd() {
		return mfd;
	}
	public void setMfd(String mfd) {
		this.mfd = mfd;
	}
	public String getsLocation() {
		return sLocation;
	}
	public void setsLocation(String sLocation) {
		this.sLocation = sLocation;
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
	public int getBasicExp() {
		return basicExp;
	}
	public void setBasicExp(int basicExp) {
		this.basicExp = basicExp;
	}
	@Override
	public String toString() {
		return "ProductStorage [storageCode=" + storageCode + ", storageDate=" + storageDate + ", color=" + color
				+ ", sectionCode=" + sectionCode + ", Section=" + Section + ", mfd=" + mfd + ", sLocation=" + sLocation
				+ ", quantity=" + quantity + ", pCode=" + pCode + ", pName=" + pName + ", basicExp=" + basicExp + "]";
	}

	
	
	
	
}
