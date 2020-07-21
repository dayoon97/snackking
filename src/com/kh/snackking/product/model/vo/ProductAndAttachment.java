package com.kh.snackking.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ProductAndAttachment implements Serializable{
	private String pCode; //상품코드(인위적 식별자)
	private String pName; //상품명
	private int pExp; //기본 유통기한
	private String pVendor; //상품업체명 (ex 오리온, 매일유업)
	private String ptCode; //상품 종류 코드 PT1, PT2..
	private String ptName; //상품 종류명  ex)과자, 젤리.. (상품 테이블과 상품종류 테이블 조인해서 상품종류명 가져올 예정)
	private int price; //상품가격
	private String search_YN;//상품 재고 부족시 재고 보충될 때까지 일시적으로 조회 불가능하게 할 컬럼
	private String delete_YN;//상품 정보 삭제 여부
	private String flavor;//향
	private String taste; //맛
	private String allergy; //알레르기
	private String age; //나이 (20, 30, 40, 50, 60 대 문자열로 합쳐서 받을 예정)
	private int fid;
	//private String pCode; 두개 VO 합치면서 중복.
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String status;
	
	
	
	public ProductAndAttachment() {
		super();
		// TODO Auto-generated constructor stub
	}



	public ProductAndAttachment(String pCode, String pName, int pExp, String pVendor, String ptCode, String ptName,
			int price, String search_YN, String delete_YN, String flavor, String taste, String allergy, String age,
			int fid, String originName, String changeName, String filePath, Date uploadDate, String status) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.pExp = pExp;
		this.pVendor = pVendor;
		this.ptCode = ptCode;
		this.ptName = ptName;
		this.price = price;
		this.search_YN = search_YN;
		this.delete_YN = delete_YN;
		this.flavor = flavor;
		this.taste = taste;
		this.allergy = allergy;
		this.age = age;
		this.fid = fid;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
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



	public int getpExp() {
		return pExp;
	}



	public void setpExp(int pExp) {
		this.pExp = pExp;
	}



	public String getpVendor() {
		return pVendor;
	}



	public void setpVendor(String pVendor) {
		this.pVendor = pVendor;
	}



	public String getPtCode() {
		return ptCode;
	}



	public void setPtCode(String ptCode) {
		this.ptCode = ptCode;
	}



	public String getPtName() {
		return ptName;
	}



	public void setPtName(String ptName) {
		this.ptName = ptName;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getSearch_YN() {
		return search_YN;
	}



	public void setSearch_YN(String search_YN) {
		this.search_YN = search_YN;
	}



	public String getDelete_YN() {
		return delete_YN;
	}



	public void setDelete_YN(String delete_YN) {
		this.delete_YN = delete_YN;
	}



	public String getFlavor() {
		return flavor;
	}



	public void setFlavor(String flavor) {
		this.flavor = flavor;
	}



	public String getTaste() {
		return taste;
	}



	public void setTaste(String taste) {
		this.taste = taste;
	}



	public String getAllergy() {
		return allergy;
	}



	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}



	public String getAge() {
		return age;
	}



	public void setAge(String age) {
		this.age = age;
	}



	public int getFid() {
		return fid;
	}



	public void setFid(int fid) {
		this.fid = fid;
	}



	public String getOriginName() {
		return originName;
	}



	public void setOriginName(String originName) {
		this.originName = originName;
	}



	public String getChangeName() {
		return changeName;
	}



	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}



	public String getFilePath() {
		return filePath;
	}



	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}



	public Date getUploadDate() {
		return uploadDate;
	}



	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	@Override
	public String toString() {
		return "ProductAndAttachment [pCode=" + pCode + ", pName=" + pName + ", pExp=" + pExp + ", pVendor=" + pVendor
				+ ", ptCode=" + ptCode + ", ptName=" + ptName + ", price=" + price + ", search_YN=" + search_YN
				+ ", delete_YN=" + delete_YN + ", flavor=" + flavor + ", taste=" + taste + ", allergy=" + allergy
				+ ", age=" + age + ", fid=" + fid + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", status=" + status + "]";
	}
	
	
	
	
	
}
