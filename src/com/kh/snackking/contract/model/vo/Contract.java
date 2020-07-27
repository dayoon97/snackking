package com.kh.snackking.contract.model.vo;


public class Contract implements java.io.Serializable {
	
	//11개
	private String businessNo;   //사업자등록번호
	private String startDate;    //계약시작일
	private String endDate;      //계약종료일 
	private String conDate;      //계약일
	private int delivCount;    	 //월배송횟수
	private int amountPDeliv;  	 //회차당 금액
	private String endYN;        //계약종료여부YN. 체크 제약조건
	private int userNo;          //회원번호. foriegn key
	private String corpName;     //거래처명 
	private int ttlAmount;       //월 계약금액
	private int conNo;           //계약번호. 시퀀스 nextval로 숫자 순차적으로 나열. primary key
	
	
	public Contract() {}
	
	
	public Contract(String businessNo, String startDate, String endDate, String conDate, int delivCount,
			int amountPDeliv, String endYN, int userNo, String corpName, int ttlAmount, int conNo) {
		super();
		this.businessNo = businessNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.conDate = conDate;
		this.delivCount = delivCount;
		this.amountPDeliv = amountPDeliv;
		this.endYN = endYN;
		this.userNo = userNo;
		this.corpName = corpName;
		this.ttlAmount = ttlAmount;
		this.conNo = conNo;
	}

	
	public Contract(String businessNo, String startDate, String endDate, String conDate, int delivCount,
			int amountPDeliv, String corpName, int ttlAmount, int conNo) {
		super();
		this.businessNo = businessNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.conDate = conDate;
		this.delivCount = delivCount;
		this.amountPDeliv = amountPDeliv;
		this.corpName = corpName;
		this.ttlAmount = ttlAmount;
		this.conNo = conNo;
	}

	
	
	

	public String getBusinessNo() {
		return businessNo;
	}


	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getConDate() {
		return conDate;
	}


	public void setConDate(String conDate) {
		this.conDate = conDate;
	}


	public int getDelivCount() {
		return delivCount;
	}


	public void setDelivCount(int delivCount) {
		this.delivCount = delivCount;
	}


	public int getAmountPDeliv() {
		return amountPDeliv;
	}


	public void setAmountPDeliv(int amountPDeliv) {
		this.amountPDeliv = amountPDeliv;
	}


	public String getEndYN() {
		return endYN;
	}


	public void setEndYN(String endYN) {
		this.endYN = endYN;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getCorpName() {
		return corpName;
	}


	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}


	public int getTtlAmount() {
		return ttlAmount;
	}


	public void setTtlAmount(int ttlAmount) {
		this.ttlAmount = ttlAmount;
	}


	public int getConNo() {
		return conNo;
	}


	public void setConNo(int conNo) {
		this.conNo = conNo;
	}


	
	
	@Override
	public String toString() {
		return "Contract [businessNo=" + businessNo + ", startDate=" + startDate + ", endDate=" + endDate + ", conDate="
				+ conDate + ", delivCount=" + delivCount + ", amountPDeliv=" + amountPDeliv + ", endYN=" + endYN
				+ ", userNo=" + userNo + ", corpName=" + corpName + ", ttlAmount=" + ttlAmount + ", conNo=" + conNo
				+ "]";
	}
	
	
	
	/*BUSINESS_NO		VARCHAR2(60 BYTE)	No		1		사업자등록번호
	START_DATE			VARCHAR2(30 BYTE)	No		2		계약시작일
	END_DATE			VARCHAR2(30 BYTE)	No		3		계약종료일
	CONTRACT_DATE		VARCHAR2(30 BYTE)	No		4		계약일
	DELIVERY_COUNT		NUMBER(20,0)	No		5			월배송횟수
	AMOUNT_PER_DELIVERY	NUMBER(30,0)	No		6			회차당 금액
	END_YN				VARCHAR2(10 BYTE)	No	'Y' 	7	계약종료여부YN
	USER_NO				NUMBER(30,0)	No		8			회원번호
	CORP_NAME			VARCHAR2(60 BYTE)	No		9		거래처명
	TOTAL_AMOUNT		NUMBER(30,0)	No		10			월계약금액
	CONTRACT_NO			NUMBER(30,0)	No		11			계약번호*/
	
	
	
	
	
	
	
	
}



