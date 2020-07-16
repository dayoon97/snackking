package com.kh.snackking.equipment.model.vo;

import java.io.Serializable;
import java.sql.Connection;

//설비 클래스
public class Equipment implements Serializable{
	private String equipCode; //설비 고유 코드 (이걸로 각각의 설비 관리,primary key)
    private String equipType; //설비 타입 : 소형냉장고, 대형 냉장고 , 소형 진열대, 대형진열대
	private String equipName; //설비명 (모델명)
	private String possible; //설비 대여 가능 여부 Y, N (현재의 대여상태 의미)
	private String equipMake; //제조사 : 샘쏭, 엘징 등.
	private String status;
	public Equipment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Equipment(String equipCode, String equipType, String equipName, String possible, String equipMake, String status) {
		super();
		this.equipCode = equipCode;
		this.equipType = equipType;
		this.equipName = equipName;
		this.possible = possible;
		this.equipMake = equipMake;
		this.status  = status;
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
	public String getPossible() {
		return possible;
	}
	public void setPossible(String possible) {
		this.possible = possible;
	}
	public String getEquipMake() {
		return equipMake;
	}
	public void setEquipMake(String equipMake) {
		this.equipMake = equipMake;
	}
	
	
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Equipment [equipCode=" + equipCode + ", equipType=" + equipType + ", equipName=" + equipName
				+ ", possible=" + possible + ", equipMake=" + equipMake + ", status=" + status + "]";
	}
	

}
