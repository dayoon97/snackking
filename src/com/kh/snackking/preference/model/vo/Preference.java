package com.kh.snackking.preference.model.vo;

import java.sql.Date;

public class Preference implements java.io.Serializable{
	private int userNo;     		  //유저 번호
	private String userName;			//유저이름
	private String userCom;				//유저상호명
	private int preNo;       		  //선호도 아이디
	private int preBudget;    		  //예산
	private int prePersonnel; 	     //인원수
	private String preAge;    	 	 //나이
	private String preProductTypes;   //상품 종류
	private String preTaste; 			//맛 종류
	private String preFlavor;			//향 종류
	private String preEtcFlavor; 	   //기타 향
	private String preAlName;   	   //알레르기 종류
	private String preStyle;     	  //구성 스타일
	private String preEquipment; 	  //수요설비
	private String preDate;			//날짜
	private String status; //삭제여부
	
	public Preference() {}

	public Preference(int userNo, String userName, String userCom, int preNo, int preBudget, int prePersonnel,
			String preAge, String preProductTypes, String preTaste, String preFlavor, String preEtcFlavor,
			String preAlName, String preStyle, String preEquipment, String preDate, String status) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.userCom = userCom;
		this.preNo = preNo;
		this.preBudget = preBudget;
		this.prePersonnel = prePersonnel;
		this.preAge = preAge;
		this.preProductTypes = preProductTypes;
		this.preTaste = preTaste;
		this.preFlavor = preFlavor;
		this.preEtcFlavor = preEtcFlavor;
		this.preAlName = preAlName;
		this.preStyle = preStyle;
		this.preEquipment = preEquipment;
		this.preDate = preDate;
		this.status = status;
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

	/**
	 * @return the userCom
	 */
	public String getUserCom() {
		return userCom;
	}

	/**
	 * @param userCom the userCom to set
	 */
	public void setUserCom(String userCom) {
		this.userCom = userCom;
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
	 * @return the preBudget
	 */
	public int getPreBudget() {
		return preBudget;
	}

	/**
	 * @param preBudget the preBudget to set
	 */
	public void setPreBudget(int preBudget) {
		this.preBudget = preBudget;
	}

	/**
	 * @return the prePersonnel
	 */
	public int getPrePersonnel() {
		return prePersonnel;
	}

	/**
	 * @param prePersonnel the prePersonnel to set
	 */
	public void setPrePersonnel(int prePersonnel) {
		this.prePersonnel = prePersonnel;
	}

	/**
	 * @return the preAge
	 */
	public String getPreAge() {
		return preAge;
	}

	/**
	 * @param preAge the preAge to set
	 */
	public void setPreAge(String preAge) {
		this.preAge = preAge;
	}

	/**
	 * @return the preProductTypes
	 */
	public String getPreProductTypes() {
		return preProductTypes;
	}

	/**
	 * @param preProductTypes the preProductTypes to set
	 */
	public void setPreProductTypes(String preProductTypes) {
		this.preProductTypes = preProductTypes;
	}

	/**
	 * @return the preTaste
	 */
	public String getPreTaste() {
		return preTaste;
	}

	/**
	 * @param preTaste the preTaste to set
	 */
	public void setPreTaste(String preTaste) {
		this.preTaste = preTaste;
	}

	/**
	 * @return the preFlavor
	 */
	public String getPreFlavor() {
		return preFlavor;
	}

	/**
	 * @param preFlavor the preFlavor to set
	 */
	public void setPreFlavor(String preFlavor) {
		this.preFlavor = preFlavor;
	}

	/**
	 * @return the preEtcFlavor
	 */
	public String getPreEtcFlavor() {
		return preEtcFlavor;
	}

	/**
	 * @param preEtcFlavor the preEtcFlavor to set
	 */
	public void setPreEtcFlavor(String preEtcFlavor) {
		this.preEtcFlavor = preEtcFlavor;
	}

	/**
	 * @return the preAlName
	 */
	public String getPreAlName() {
		return preAlName;
	}

	/**
	 * @param preAlName the preAlName to set
	 */
	public void setPreAlName(String preAlName) {
		this.preAlName = preAlName;
	}

	/**
	 * @return the preStyle
	 */
	public String getPreStyle() {
		return preStyle;
	}

	/**
	 * @param preStyle the preStyle to set
	 */
	public void setPreStyle(String preStyle) {
		this.preStyle = preStyle;
	}

	/**
	 * @return the preEquipment
	 */
	public String getPreEquipment() {
		return preEquipment;
	}

	/**
	 * @param preEquipment the preEquipment to set
	 */
	public void setPreEquipment(String preEquipment) {
		this.preEquipment = preEquipment;
	}

	/**
	 * @return the preDate
	 */
	public String getPreDate() {
		return preDate;
	}

	/**
	 * @param preDate the preDate to set
	 */
	public void setPreDate(String preDate) {
		this.preDate = preDate;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Preference [userNo=" + userNo + ", userName=" + userName + ", userCom=" + userCom + ", preNo=" + preNo
				+ ", preBudget=" + preBudget + ", prePersonnel=" + prePersonnel + ", preAge=" + preAge
				+ ", preProductTypes=" + preProductTypes + ", preTaste=" + preTaste + ", preFlavor=" + preFlavor
				+ ", preEtcFlavor=" + preEtcFlavor + ", preAlName=" + preAlName + ", preStyle=" + preStyle
				+ ", preEquipment=" + preEquipment + ", preDate=" + preDate + ", status=" + status + "]";
	}

	
}
