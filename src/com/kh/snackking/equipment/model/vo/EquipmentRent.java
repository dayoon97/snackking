package com.kh.snackking.equipment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class EquipmentRent implements Serializable{
	
	private int rentCode; //설비 대여번호 문자열 + 시퀀스 
	//private Date rentDate; //대여일 /보여줄 것
	private String rentDate;
	private String backDate; //회수일
	private String equipCode; //설비코드
	private String equipType; //설비 테이블과 조인해서 가져올 설비 타입 /보여줄 것
	private String equipName; //설비 테이블과 조인해서 가져올 설비 모델명 /보여줄 것
	private String equipMake; //설비 테이블과 조인해서 가져올 설비 제조사 /보여줄 것
	private int userNo; //유저번호
	private String company; //유저테이블과 조인해서 가져올 회사명(대여해간 회사명) / 보여줄 것1
	private String status;//조회 상태, 기본값 Y
	
	public EquipmentRent() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EquipmentRent(int rentCode, String rentDate, String backDate, String equipCode, String equipType,
			String equipName, String equipMake, int userNo, String company, String status) {
		super();
		this.rentCode = rentCode;
		this.rentDate = rentDate;
		this.backDate = backDate;
		this.equipCode = equipCode;
		this.equipType = equipType;
		this.equipName = equipName;
		this.equipMake = equipMake;
		this.userNo = userNo;
		this.company = company;
		this.status = status;
	}
	public int getRentCode() {
		return rentCode;
	}
	public void setRentCode(int rentCode) {
		this.rentCode = rentCode;
	}
	public String getRentDate() {
		return rentDate;
	}
	public void setRentDate(String rentDate) {
		this.rentDate = rentDate;
	}
	public String getBackDate() {
		return backDate;
	}
	public void setBackDate(String backDate) {
		this.backDate = backDate;
	}
	public String getEquipCode() {
		return equipCode;
	}
	public void setEquipCode(String equipCode) {
		this.equipCode = equipCode;
	}
	public String getEquipType() {
		return equipType;
	}
	public void setEquipType(String equipType) {
		this.equipType = equipType;
	}
	public String getEquipName() {
		return equipName;
	}
	public void setEquipName(String equipName) {
		this.equipName = equipName;
	}
	public String getEquipMake() {
		return equipMake;
	}
	public void setEquipMake(String equipMake) {
		this.equipMake = equipMake;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "EquipmentRent [rentCode=" + rentCode + ", rentDate=" + rentDate + ", backDate=" + backDate
				+ ", equipCode=" + equipCode + ", equipType=" + equipType + ", equipName=" + equipName + ", equipMake="
				+ equipMake + ", userNo=" + userNo + ", company=" + company + ", status=" + status + "]";
	}
	
	
	
	
}
