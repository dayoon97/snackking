package com.kh.snackking.exchange.model.vo;

import java.io.Serializable;

//교환 클래스
public class Exchange implements Serializable {

	private int list_Code;//리스트코드
	private int count;//상품수량
	private String p_Code;//상품코드
	private String exchange_Code;//교환코드
	private int user_No;//유저번호
	private String status;//삭제여부
	
	public Exchange() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Exchange(int list_Code, int count, String p_Code, String exchange_Code, int user_No, String status) {
		super();
		this.list_Code = list_Code;
		this.count = count;
		this.p_Code = p_Code;
		this.exchange_Code = exchange_Code;
		this.user_No = user_No;
		this.status = status;
	}

	public int getList_Code() {
		return list_Code;
	}

	public void setList_Code(int list_Code) {
		this.list_Code = list_Code;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getP_Code() {
		return p_Code;
	}

	public void setP_Code(String p_Code) {
		this.p_Code = p_Code;
	}

	public String getExchange_Code() {
		return exchange_Code;
	}

	public void setExchange_Code(String exchange_Code) {
		this.exchange_Code = exchange_Code;
	}

	public int getUser_No() {
		return user_No;
	}

	public void setUser_No(int user_No) {
		this.user_No = user_No;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Exchange [list_Code=" + list_Code + ", count=" + count + ", p_Code=" + p_Code + ", exchange_Code="
				+ exchange_Code + ", user_No=" + user_No + ", status=" + status + "]";
	}

	
	
}
