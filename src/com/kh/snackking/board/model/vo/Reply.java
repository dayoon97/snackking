package com.kh.snackking.board.model.vo;

import java.sql.Date;

public class Reply implements java.io.Serializable{
	
	private int rid;
	private int rno;
	private int bid;
	private String rContent;
	private int rWriter;
	private String userName;
	private Date rDate;
	private String status;
	
	public Reply() {}

	public Reply(int rid, int rno, int bid, String rContent, int rWriter, String userName, Date rDate, String status) {
		super();
		this.rid = rid;
		this.rno = rno;
		this.bid = bid;
		this.rContent = rContent;
		this.rWriter = rWriter;
		this.userName = userName;
		this.rDate = rDate;
		this.status = status;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public int getrWriter() {
		return rWriter;
	}

	public void setrWriter(int rWriter) {
		this.rWriter = rWriter;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Reply [rid=" + rid + ", rno=" + rno + ", bid=" + bid + ", rContent=" + rContent + ", rWriter=" + rWriter
				+ ", userName=" + userName + ", rDate=" + rDate + ", status=" + status + "]";
	}
	
}
