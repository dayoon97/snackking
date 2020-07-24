package com.kh.snackking.scheduler.model.vo;

import java.sql.Date;

public class Scheduler implements java.io.Serializable {
	
	private int userNo;
	private String tCode;
	private String userId;
	private String userPwd;
	private String userName;
	private String company;
	private String phone;
	private String email;
	private int zipNo;
	private String address;
	private int mngId;
	private String enrollDate;
	private Date withdrawalDate;
	private String status;
	private int delivCount;
	private Date scheduleDate;
	
	public Scheduler() {}
	
	

	public Scheduler(String userName) {
		super();
		this.userName = userName;
	}



	public Scheduler(int userNo, String tCode, String userId, String userPwd, String userName, String company,
			String phone, String email, int zipNo, String address, int mngId, String enrollDate, Date withdrawalDate,
			String status, int delivCount, Date scheduleDate) {
		super();
		this.userNo = userNo;
		this.tCode = tCode;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.company = company;
		this.phone = phone;
		this.email = email;
		this.zipNo = zipNo;
		this.address = address;
		this.mngId = mngId;
		this.enrollDate = enrollDate;
		this.withdrawalDate = withdrawalDate;
		this.status = status;
		this.delivCount = delivCount;
		this.scheduleDate = scheduleDate;
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public String gettCode() {
		return tCode;
	}



	public void settCode(String tCode) {
		this.tCode = tCode;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getUserPwd() {
		return userPwd;
	}



	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getCompany() {
		return company;
	}



	public void setCompany(String company) {
		this.company = company;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public int getZipNo() {
		return zipNo;
	}



	public void setZipNo(int zipNo) {
		this.zipNo = zipNo;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public int getMngId() {
		return mngId;
	}



	public void setMngId(int mngId) {
		this.mngId = mngId;
	}



	public String getEnrollDate() {
		return enrollDate;
	}



	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}



	public Date getWithdrawalDate() {
		return withdrawalDate;
	}



	public void setWithdrawalDate(Date withdrawalDate) {
		this.withdrawalDate = withdrawalDate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public int getDelivCount() {
		return delivCount;
	}



	public void setDelivCount(int delivCount) {
		this.delivCount = delivCount;
	}

	
	public Date getScheduleDate() {
		return scheduleDate;
	}



	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	@Override
	public String toString() {
		return "Scheduler [userNo=" + userNo + ", tCode=" + tCode + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", userName=" + userName + ", company=" + company + ", phone=" + phone + ", email=" + email
				+ ", zipNo=" + zipNo + ", address=" + address + ", mngId=" + mngId + ", enrollDate=" + enrollDate
				+ ", withdrawalDate=" + withdrawalDate + ", status=" + status + ", delivCount=" + delivCount
				+ ", scheduleDate=" + scheduleDate + "]";
	}



	



	
	
}
