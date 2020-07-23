package com.kh.snackking.curating.model.vo;

import java.sql.Date;

public class CurationList implements java.io.Serializable {
	
	private int cuNo;
	private Date cuDate;
	
	public CurationList() {}

	public CurationList(int cuNo, Date cuDate) {
		super();
		this.cuNo = cuNo;
		this.cuDate = cuDate;
	}

	public int getCuNo() {
		return cuNo;
	}

	public void setCuNo(int cuNo) {
		this.cuNo = cuNo;
	}

	public Date getCuDate() {
		return cuDate;
	}

	public void setCuDate(Date cuDate) {
		this.cuDate = cuDate;
	}

	@Override
	public String toString() {
		return "CurationList [cuNo=" + cuNo + ", cuDate=" + cuDate + "]";
	}

	
	
}
