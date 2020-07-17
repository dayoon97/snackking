package com.kh.snackking.board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{
	
	private int bid;
	private String bType;
	private String btName;
	private int bno;
	private String bTitle;
	private String bContent;
	private int bWriter;
	private String userName;
	private int bCount;
	private Date bDate;
	private String status;
	
	public Board() {}

	public Board(int bid, String bType, String btName, int bno, String bTitle, String bContent, int bWriter,
			String userName, int bCount, Date bDate, String status) {
		super();
		this.bid = bid;
		this.bType = bType;
		this.btName = btName;
		this.bno = bno;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.userName = userName;
		this.bCount = bCount;
		this.bDate = bDate;
		this.status = status;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	public String getBtName() {
		return btName;
	}

	public void setBtName(String btName) {
		this.btName = btName;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public int getbWriter() {
		return bWriter;
	}

	public void setbWriter(int bWriter) {
		this.bWriter = bWriter;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Board [bid=" + bid + ", bType=" + bType + ", btName=" + btName + ", bno=" + bno + ", bTitle=" + bTitle
				+ ", bContent=" + bContent + ", bWriter=" + bWriter + ", userName=" + userName + ", bCount=" + bCount
				+ ", bDate=" + bDate + ", status=" + status + "]";
	}
	
}