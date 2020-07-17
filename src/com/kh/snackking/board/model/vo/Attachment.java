package com.kh.snackking.board.model.vo;

import java.sql.Date;

public class Attachment implements java.io.Serializable {
	
	private int fid;
	private int bid;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String status;
	
	public Attachment() {}

	public Attachment(int fid, int bid, String originName, String changeName, String filePath, Date uploadDate,
			String status) {
		super();
		this.fid = fid;
		this.bid = bid;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
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
		return "Attachment [fid=" + fid + ", bid=" + bid + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", status=" + status + "]";
	}
	
}
