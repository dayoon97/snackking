package com.kh.snackking.preference.model.vo;

public class curatingList implements java.io.Serializable {
	private int preNo; //선호도번호
	private String userName; //유저이름
	private String userCom; //유저 회사명
	private String status; // 큐레이팅 여부
	
	public curatingList(){}

	public curatingList(int preNo, String userName, String userCom, String status) {
		super();
		this.preNo = preNo;
		this.userName = userName;
		this.userCom = userCom;
		this.status = status;
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
		return "curatingList [preNo=" + preNo + ", userName=" + userName + ", userCom=" + userCom + ", status=" + status
				+ "]";
	}
	
}
