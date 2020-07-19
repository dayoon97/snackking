package com.kh.snackking.board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{
	
	private int rNum;
	private int bid;
	private String bType;
	private String btName;
	private int bno;
	private String bTitle;
	private String bContent;
	private int bWriter;
	private String userName;
	private String userId;
	private int bCount;
	private Date bDate;
	private String status;
	private int rid;
	private String answerCheck;
	
	public Board() {}

	public Board(int rNum, int bid, String bType, String btName, int bno, String bTitle, String bContent, int bWriter,
			String userName, String userId, int bCount, Date bDate, String status, int rid, String answerCheck) {
		super();
		this.rNum = rNum;
		this.bid = bid;
		this.bType = bType;
		this.btName = btName;
		this.bno = bno;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.userName = userName;
		this.userId = userId;
		this.bCount = bCount;
		this.bDate = bDate;
		this.status = status;
		this.rid = rid;
		this.answerCheck = answerCheck;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getAnswerCheck() {
		return answerCheck;
	}

	public void setAnswerCheck(String answerCheck) {
		this.answerCheck = answerCheck;
	}

	@Override
	public String toString() {
		return "Board [rNum=" + rNum + ", bid=" + bid + ", bType=" + bType + ", btName=" + btName + ", bno=" + bno
				+ ", bTitle=" + bTitle + ", bContent=" + bContent + ", bWriter=" + bWriter + ", userName=" + userName
				+ ", userId=" + userId + ", bCount=" + bCount + ", bDate=" + bDate + ", status=" + status + ", rid="
				+ rid + ", answerCheck=" + answerCheck + "]";
	}
		
}
